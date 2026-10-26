## startup script

dnf update -y
dnf install -y python3 python3-pip git
cd /home/ec2-user

git clone https://github.com/mota57v2/demo-market-api-aws-tutorial

### Create application directory
chown ec2-user:ec2-user /home/ec2-user/demo-market-api-aws-tutorial

### enter to the project directory
cd /home/ec2-user/demo-market-api-aws-tutorial

### create virtual environment
python3 -m venv .venv
source .venv/bin/activate

### Install application dependencies
pip install flask gunicorn boto3

### edit  file and past the code bellow
cat myapi.service > /etc/systemd/system/myapi.service

### config systemd
sudo systemctl daemon-reload
sudo systemctl start myapi