#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y python3 python3-pip git

APP_DIR=/home/ec2-user/demo-market-api-aws-tutorial

git clone https://github.com/mota57v2/demo-market-api-aws-tutorial "$APP_DIR"
cd "$APP_DIR"

python3 -m venv .venv
.venv/bin/pip install flask gunicorn boto3

cp myapi.service /etc/systemd/system/myapi.service

chown -R ec2-user:ec2-user "$APP_DIR"

systemctl daemon-reload
systemctl enable --now myapi