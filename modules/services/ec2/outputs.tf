output "ec2-public-ip-out" {
  value = aws_instance.my_web_server.public_ip
}