#! /bin/bash
## do not use sudo in prod env
sudo yum update -y
sudo amazon-linux-extras install -y nginx1.12
sudo service nginx start
