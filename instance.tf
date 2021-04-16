resource "aws_instance" "web-srv" {
  ami           = "ami-031b673f443c2172c" // Ubuntu Server 20.04 LTS
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    aws_security_group.http.id,
    aws_security_group.https.id,
  ]

  tags = {
    Name = "web-srv"
  }
}
