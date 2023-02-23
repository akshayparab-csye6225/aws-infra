resource "aws_security_group" "application" {
  name   = var.sg_name
  vpc_id = var.vpc-id-in

  dynamic "ingress" {
    iterator = port
    for_each = var.tcp_ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.protocol["tcp"]
      cidr_blocks = var.tcp_ingress_cidr
    }
  }
  tags = {
    Name = var.sg_name
  }
}
