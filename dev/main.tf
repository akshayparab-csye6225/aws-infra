module "networking_service" {
  source               = "../modules/services/networking"
  env                  = var.env
  aws_region           = var.aws_region
  vpc_cidr_block       = var.vpc_cidr_block
  ig_cidr_block        = var.ig_cidr_block
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}
module "security_group" {
  source = "../modules/services/securityGroup"
  depends_on = [
    module.networking_service,
  ]
  sg_name           = var.sg_name
  vpc-id-in         = module.networking_service.vpc-id-out
  tcp_ingress_ports = var.tcp_ingress_ports
  protocol          = var.protocol
  tcp_ingress_cidr  = var.tcp_ingress_cidr
}
module "ec2_instance" {
  source = "../modules/services/ec2"
  depends_on = [
    module.networking_service,
    module.security_group
  ]
  ami_id                            = var.ami_id
  vpc-public-subnet-id-in           = module.networking_service.vpc-public-subnet-id-out
  ec2-security-group-id-in          = module.security_group.ec2-security-group-id-out
  ec2_instance_type                 = var.ec2_instance_type
  associate_public_ip_address       = var.associate_public_ip_address
  disable_api_termination           = var.disable_api_termination
  root_volume_size                  = var.root_volume_size
  root_volume_type                  = var.root_volume_type
  root_volume_delete_on_termination = var.root_volume_delete_on_termination
}