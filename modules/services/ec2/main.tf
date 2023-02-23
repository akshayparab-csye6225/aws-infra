# Define the EC2 instance
data "aws_ami" "latest" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_name_regex]
  }
}
resource "aws_instance" "my_web_server" {
  ami                         = var.ami_id == null ? data.aws_ami.latest.id : var.ami_id
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.vpc-public-subnet-id-in
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [var.ec2-security-group-id-in]
  disable_api_termination     = var.disable_api_termination
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = var.root_volume_delete_on_termination
  }
  tags = {
    Name = "Web Server"
  }
}