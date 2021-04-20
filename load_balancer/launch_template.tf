resource "aws_launch_template" "lt" {
  image_id      = "ami-031b673f443c2172c" // Ubuntu Server 20.04 LTS
  instance_type = "t3.micro"
  key_name      = data.terraform_remote_state.infra.outputs.ssh_key.key_name

  vpc_security_group_ids = [
    data.terraform_remote_state.infra.outputs.sg_allow_ssh.id,
    data.terraform_remote_state.infra.outputs.sg_allow_http.id,
    data.terraform_remote_state.infra.outputs.sg_allow_https.id,
  ]

  user_data = filebase64("${path.module}/init.sh")
}
