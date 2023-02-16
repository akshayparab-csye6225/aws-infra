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