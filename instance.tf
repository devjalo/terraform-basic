resource "aws_instance" "ec2-instance" {
  ami = var.ami_id
  instance_type = "t2.micro"
  key_name = var.ami_key_pair_name
  security_groups = [
    aws_security_group.http.id,
    aws_security_group.allow-ssh.id,
    aws_security_group.allow-tls.id
  ]
  tags = {
    Name = var.ami_name
  }
  subnet_id = aws_subnet.subnet.id

  //optional startup-script
  user_data = file("build/nginx/init.sh")
}