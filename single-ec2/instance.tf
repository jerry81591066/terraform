data "terraform_remote_state" "infra" {
  backend = "local"

  config = {
    path = "../infra/terraform.tfstate"
  }
}

resource "aws_instance" "web-srv" {
  ami           = "ami-031b673f443c2172c" // Ubuntu Server 20.04 LTS
  instance_type = "t3.micro"
  key_name      = data.terraform_remote_state.infra.outputs.ssh_key.id
  vpc_security_group_ids = [
    data.terraform_remote_state.infra.outputs.sg_allow_ssh.id,
    data.terraform_remote_state.infra.outputs.sg_allow_http.id,
    data.terraform_remote_state.infra.outputs.sg_allow_https.id,
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
