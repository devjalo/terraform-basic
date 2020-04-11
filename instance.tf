resource "aws_instance" "ec2-instance" {
  ami = var.ami_id
  instance_type = "t2.micro"
  key_name = var.ami_key_pair_name
  security_groups = [
    aws_security_group.http-allow,
    aws_security_group.allow-ssh,
    aws_security_group.allow-tls
  ]

  tags {
    Name = var.ami_name
  }
}