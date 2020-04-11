resource "aws_security_group" "http-allow" {
  name = "http"
  vpc_id = aws_vpc.basic-env.id
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "http-allow"
  }
}

resource "aws_security_group" "allow-ssh" {
  name = "allow-all"
  vpc_id = aws_vpc.basic-env.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "allow-ssh"
  }
}

resource "aws_security_group" "allow-tls" {
  name = "allow-tls"
  vpc_id = aws_vpc.basic-env.id

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "allow-tls"
  }
}