## For local test

* create virtual environment
`python3 -m venv .venv`

* activate the environment
`.\.venv\Scripts\activate`

* install package (one time)
`pip install -r requierments.txt`

* run the app while virtual environment is activated
python app.py

## connect to ssh
* connect to ssh to the ec2 instance
ssh -i "<path-my-key.pem>" ec2-user@<your-instance-public-dns>



## Reload systemd configuration
sudo systemctl daemon-reload

## Start the service
sudo systemctl start myapi

## Enable automatic start on boot
sudo systemctl enable myapi

## Check service status
sudo systemctl status myapi

## View logs
sudo journalctl -u myapi -f




# Containers

## create repo
aws ecr create-repository --repository-name market-repo --region us-east-1

{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:655916164440:repository/market-repo",
        "registryId": "655916164440",
        "repositoryName": "market-repo",
        "repositoryUri": "655916164440.dkr.ecr.us-east-1.amazonaws.com/market-repo",
        "createdAt": "2026-10-20T08:33:13.073000-04:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}

# Building and pushing images
$ACCOUNT="655916164440" # enter your account
$REGION="us-east-1"

## Get login token
### RUN ON WINDOWS
- aws ecr get-login-password --region $REGION > temp-password.txt
### Run on WSL
- cat temp-password.txt | docker login --username AWS --password-stdin $ACCOUNT.dkr.ecr.$REGION.amazonaws.com

## Build image
docker build -t market-api:latest .

## Tag image
docker tag market-api:latest $ACCOUNT.dkr.ecr.$REGION.amazonaws.com/market-repo:latest

## Push image
docker push $ACCOUNT.dkr.ecr.$REGION.amazonaws.com/market-repo:latest

## To run the image locally

To match the port 8000
- docker run -p 8000:8000 market-api:latest

To match another port 
- docker run -e PORT=5000 -p 5000:5000 market-api:latest



