resource "aws_launch_template" "lt" {
  image_id      = "ami-031b673f443c2172c" // Ubuntu Server 20.04 LTS
  instance_type = "t3.micro"
  key_name      = aws_key_pair.ssh_key.key_name

  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    aws_security_group.http.id,
    aws_security_group.https.id,
  ]

  user_data = filebase64("${path.module}/init.sh")
}
