resource "aws_security_group" "ssh" {
  name = "allow_ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sg_allow_ssh" {
  value = aws_security_group.ssh
}

resource "aws_security_group" "http" {
  name = "allow_http"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sg_allow_http" {
  value = aws_security_group.http
}

resource "aws_security_group" "https" {
  name = "allow_https"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sg_allow_https" {
  value = aws_security_group.https
}

resource "aws_security_group" "elb" {
  name = "elb"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sg_elb" {
  value = aws_security_group.elb
}
