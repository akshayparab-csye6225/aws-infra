resource "aws_security_group" "security_group" {
  name   = var.sg_name
  vpc_id = var.vpc-id-in

  dynamic "ingress" {
    iterator = port
    for_each = var.tcp_ingress_ports
    content {
      from_port       = port.value
      to_port         = port.value
      protocol        = var.protocol["tcp"]
      cidr_blocks     = var.tcp_ingress_cidr
      security_groups = var.sg-id-in == null ? [] : [var.sg-id-in]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.sg_egress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = port.value == 0 ? "-1" : var.protocol["tcp"]
      cidr_blocks = var.sg_egress_cidr
    }
  }
  tags = {
    Name = var.sg_name
  }
}
