resource "aws_launch_configuration" "lc" {
  image_id      = "ami-031b673f443c2172c" // Ubuntu Server 20.04 LTS
  instance_type = "t3.micro"
  security_groups = [
    aws_security_group.ssh.id,
    aws_security_group.http.id,
    aws_security_group.https.id,
  ]

  user_data = <<-EOF
              #!/bin/bash
              [[ ! -f index.html ]] && echo "Hostname: $(hostname)" >> index.html
              sudo python3 -m http.server 80
              EOF

  lifecycle {
    create_before_destroy = true
  }
}
