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

module "app_security_group" {
  source = "../modules/services/securityGroup"
  depends_on = [
    module.networking_service,
  ]
  sg_name           = var.sg_name
  vpc-id-in         = module.networking_service.vpc-id-out
  tcp_ingress_ports = var.tcp_ingress_ports
  protocol          = var.protocol
  tcp_ingress_cidr  = var.tcp_ingress_cidr
  sg_egress_ports   = var.app_sg_egress_ports
  sg_egress_cidr    = var.app_sg_egress_cidr
}

module "db_security_group" {
  source = "../modules/services/securityGroup"
  depends_on = [
    module.networking_service,
    module.app_security_group,
  ]
  sg_name           = var.db_sg_name
  vpc-id-in         = module.networking_service.vpc-id-out
  tcp_ingress_ports = var.db_tcp_ingress_ports
  protocol          = var.db_sg_protocol
  tcp_ingress_cidr  = var.db_tcp_ingress_cidr
  sg-id-in          = module.app_security_group.security-group-id-out
}

module "mysql_rds_db" {
  source = "../modules/services/rds"
  depends_on = [
    module.networking_service,
    module.db_security_group,
  ]
  private-subnet-id-in             = module.networking_service.vpc-private-subnet-id-out
  aws_db_parameter_group_family    = var.aws_db_parameter_group_family
  rds_instance_storage             = var.rds_instance_storage
  rds_instance_engine              = var.rds_instance_engine
  rds_instance_engine_version      = var.rds_instance_engine_version
  rds_instance_class               = var.rds_instance_class
  rds_instance_identifier          = var.rds_instance_identifier
  rds_instance_name                = var.rds_instance_name
  rds_instance_port                = var.rds_instance_port
  rds_instance_username            = var.rds_instance_username
  rds_instance_password            = var.rds_instance_password
  rds_instance_skip_final_snapshot = var.rds_instance_skip_final_snapshot
  rds_instance_publicly_accessible = var.rds_instance_publicly_accessible
  rds_instance_multi_az            = var.rds_instance_multi_az
  db-security-group-id-in          = module.db_security_group.security-group-id-out
}

module "aws_s3_bucket" {
  source                                    = "../modules/services/s3bucket"
  env                                       = var.env
  acl                                       = var.acl
  s3_force_destroy                          = var.s3_force_destroy
  sse_algorithm                             = var.sse_algorithm
  transition_to_ia_id                       = var.transition_to_ia_id
  transition_to_ia_status                   = var.transition_to_ia_status
  transition_to_ia_transition_duration      = var.transition_to_ia_transition_duration
  transition_to_ia_transition_storage_class = var.transition_to_ia_transition_storage_class
  s3_versioning_configuration               = var.s3_versioning_configuration
}

module "ec2_instance" {
  source = "../modules/services/ec2"
  depends_on = [
    module.networking_service,
    module.app_security_group,
    module.aws_s3_bucket
  ]
  env                               = var.env
  ec2_iam_profile_name              = var.ec2_iam_profile_name
  aws_iam_policy_name               = var.aws_iam_policy_name
  aws_iam_policy_action             = var.aws_iam_policy_action
  s3-bucket-name-in                 = module.aws_s3_bucket.s3-bucket-name-out
  ami_id                            = var.ami_id
  vpc-public-subnet-id-in           = module.networking_service.vpc-public-subnet-id-out
  ec2-security-group-id-in          = module.app_security_group.security-group-id-out
  ec2_instance_type                 = var.ec2_instance_type
  associate_public_ip_address       = var.associate_public_ip_address
  disable_api_termination           = var.disable_api_termination
  root_volume_size                  = var.root_volume_size
  root_volume_type                  = var.root_volume_type
  root_volume_delete_on_termination = var.root_volume_delete_on_termination
  db-instance-host-in               = module.mysql_rds_db.db-instance-host-out
  rds_instance_name                 = var.rds_instance_name
  rds_instance_port                 = var.rds_instance_port
  rds_instance_username             = var.rds_instance_username
  rds_instance_password             = var.rds_instance_password
  server_port                       = var.server_port
  statsd_host                       = var.statsd_host
  statsd_port                       = var.statsd_port
  aws_iam_cw_policy_name            = var.aws_iam_cw_policy_name
}

module "dns-record" {
  source = "../modules/services/dnsRecord"
  depends_on = [
    module.ec2_instance
  ]
  ec2-public-ip-in        = module.ec2_instance.ec2-public-ip-out
  hosted_zone_name        = var.hosted_zone_name
  private_zone            = var.private_zone
  hosted_zone_domain_name = var.hosted_zone_domain_name
  hosted_zone_record_type = var.hosted_zone_record_type
  hosted_zone_record_ttl  = var.hosted_zone_record_ttl
  allow_overwrite_record  = var.allow_overwrite_record
  createAlias             = var.createAlias
  alias_domain_name       = var.alias_domain_name
  alias_record_type       = var.alias_record_type
}