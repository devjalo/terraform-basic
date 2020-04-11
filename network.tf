resource "aws_vpc" "basic-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "basic-env"
  }
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2-instance.id
  vpc = true
}