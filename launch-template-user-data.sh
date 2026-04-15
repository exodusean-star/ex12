#!/bin/bash
# EC2 시작 탬플릿 User Data
# ASG로 새 인스턴스 시작 시 자동 실행

# 1. Docker 설치 및 시작
yum install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# 2. docker-compose 설치
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64" \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# 3. nginx 마운트 디렉토리 생성
mkdir -p /home/ec2-user/nginx/conf.d
mkdir -p /home/ec2-user/nginx/html
mkdir -p /home/ec2-user/nginx/logs
chown -R ec2-user:ec2-user /home/ec2-user/nginx
