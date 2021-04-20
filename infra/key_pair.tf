resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = var.ssh_key
}

output "ssh_key" {
  value = aws_key_pair.ssh_key
}
