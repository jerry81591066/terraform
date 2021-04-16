resource "aws_instance" "web-srv" {
  ami           = "ami-031b673f443c2172c" // Ubuntu Server 20.04 LTS
  instance_type = "t3.micro"
  key_name      = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    aws_security_group.http.id,
    aws_security_group.https.id,
  ]

  user_data = <<-EOF
  #!/bin/bash
  [[ ! -f index.html ]] && echo 'Hello world' >> index.html
  sudo python3 -m http.server 80
  EOF

  tags = {
    Name = "web-srv"
  }
}

output "public_ip" {
  value = aws_instance.web-srv.public_ip
}
