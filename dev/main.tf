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

module "lb_security_group" {
  source = "../modules/services/securityGroup"
  depends_on = [
    module.networking_service,
  ]
  sg_name           = var.lb_sg_name
  vpc-id-in         = module.networking_service.vpc-id-out
  tcp_ingress_ports = var.lb_ingress_ports
  protocol          = var.lb_sg_protocol
  tcp_ingress_cidr  = var.lb_ingress_cidr
  sg_egress_ports   = var.lb_sg_egress_ports
  sg_egress_cidr    = var.lb_sg_egress_cidr
}

module "app_security_group" {
  source = "../modules/services/securityGroup"
  depends_on = [
    module.networking_service,
    module.lb_security_group
  ]
  sg_name           = var.sg_name
  vpc-id-in         = module.networking_service.vpc-id-out
  tcp_ingress_ports = var.tcp_ingress_ports
  protocol          = var.protocol
  tcp_ingress_cidr  = var.tcp_ingress_cidr
  sg_egress_ports   = var.app_sg_egress_ports
  sg_egress_cidr    = var.app_sg_egress_cidr
  sg-id-in          = module.lb_security_group.security-group-id-out
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
  kms_key_description              = var.rds_kms_key_description
  kms_key_enabled                  = var.rds_kms_key_enabled
  rds_storage_encrypted            = var.rds_storage_encrypted
  aws_user_name                    = var.aws_user_name
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

module "launch_template" {
  source = "../modules/services/launchTemplate"
  depends_on = [
    module.networking_service,
    module.app_security_group,
    module.aws_s3_bucket
  ]
  env                                = var.env
  ec2_iam_profile_name               = var.ec2_iam_profile_name
  aws_iam_policy_name                = var.aws_iam_policy_name
  aws_iam_policy_action              = var.aws_iam_policy_action
  s3-bucket-name-in                  = module.aws_s3_bucket.s3-bucket-name-out
  ami_id                             = var.ami_id
  vpc-public-subnet-id-in            = module.networking_service.vpc-public-subnet-id-out
  ec2-security-group-id-in           = module.app_security_group.security-group-id-out
  ec2_instance_type                  = var.ec2_instance_type
  associate_public_ip_address        = var.associate_public_ip_address
  disable_api_termination            = var.disable_api_termination
  root_volume_size                   = var.root_volume_size
  root_volume_type                   = var.root_volume_type
  root_volume_delete_on_termination  = var.root_volume_delete_on_termination
  db-instance-host-in                = module.mysql_rds_db.db-instance-host-out
  rds_instance_name                  = var.rds_instance_name
  rds_instance_port                  = var.rds_instance_port
  rds_instance_username              = var.rds_instance_username
  rds_instance_password              = var.rds_instance_password
  server_port                        = var.server_port
  statsd_host                        = var.statsd_host
  statsd_port                        = var.statsd_port
  aws_iam_cw_policy_name             = var.aws_iam_cw_policy_name
  launch_template_name               = var.launch_template_name
  nw_interface_delete_on_termination = var.nw_interface_delete_on_termination
  lt_block_device_name               = var.lt_block_device_name
  ebs_encrypted                      = var.ebs_encrypted
  kms_key_description                = var.kms_key_description
  kms_key_enabled                    = var.kms_key_enabled
  aws_user_name                      = var.aws_user_name
  launch_template_key_name           = var.launch_template_key_name
}

module "load_balancer" {
  source = "../modules/services/loadbalancer"
  depends_on = [
    module.networking_service,
    module.lb_security_group
  ]
  lb-sg-id-in                           = module.lb_security_group.security-group-id-out
  vpc-id-in                             = module.networking_service.vpc-id-out
  vpc-all-public-subnet-id-in           = module.networking_service.vpc-all-public-subnet-id-out
  lb_name                               = var.lb_name
  lb_internal                           = var.lb_internal
  lb_type                               = var.lb_type
  lb_ip_address_type                    = var.lb_ip_address_type
  lb_tg_name_prefix                     = var.lb_tg_name_prefix
  lb_tg_target_type                     = var.lb_tg_target_type
  lb_tg_port                            = var.lb_tg_port
  lb_tg_protocol                        = var.lb_tg_protocol
  lb_tg_protocol_version                = var.lb_tg_protocol_version
  lb_tg_healthcheck_enabled             = var.lb_tg_healthcheck_enabled
  lb_tg_healthcheck_path                = var.lb_tg_healthcheck_path
  lb_tg_healthcheck_port                = var.lb_tg_healthcheck_port
  lb_tg_healthcheck_protocol            = var.lb_tg_healthcheck_protocol
  lb_tg_healthcheck_timeout             = var.lb_tg_healthcheck_timeout
  lb_tg_healthcheck_interval            = var.lb_tg_healthcheck_interval
  lb_tg_healthcheck_healthy_threshold   = var.lb_tg_healthcheck_healthy_threshold
  lb_tg_healthcheck_unhealthy_threshold = var.lb_tg_healthcheck_unhealthy_threshold
  lb_listener_port                      = var.lb_listener_port
  lb_listener_protocol                  = var.lb_listener_protocol
  lb_listener_default_action_type       = var.lb_listener_default_action_type
  lb_algo_type                          = var.lb_algo_type
  acm_cert_issued_domain                = var.acm_cert_issued_domain
  acm_cert_statuses                     = var.acm_cert_statuses
  acm_cert_key_types                    = var.acm_cert_key_types
}

module "auto_scaling_group" {
  source = "../modules/services/autoScalingGroup"
  depends_on = [
    module.networking_service,
    module.load_balancer,
    module.launch_template,
  ]
  vpc-all-public-subnet-id-in          = module.networking_service.vpc-all-public-subnet-id-out
  launch-template-id-in                = module.launch_template.launch-template-id-out
  lb-target-group-arn-in               = module.load_balancer.lb-target-group-arn-out
  asg_name                             = var.asg_name
  asg_desired_capacity                 = var.asg_desired_capacity
  asg_max_size                         = var.asg_max_size
  asg_min_size                         = var.asg_min_size
  asg_default_cooldown                 = var.asg_default_cooldown
  asg_health_check_grace_period        = var.asg_health_check_grace_period
  asg_health_check_type                = var.asg_health_check_type
  asg_tag_key                          = var.asg_tag_key
  asg_tag_value                        = var.asg_tag_value
  asg_tag_propagate_at_launch          = var.asg_tag_propagate_at_launch
  asg_launch_template_version          = var.asg_launch_template_version
  asp_scale_down_name                  = var.asp_scale_down_name
  asp_scale_down_adjustment_type       = var.asp_scale_down_adjustment_type
  asp_scale_down_scaling_adjustment    = var.asp_scale_down_scaling_adjustment
  asp_scale_down_cooldown              = var.asp_scale_down_cooldown
  asp_scale_down_policy_type           = var.asp_scale_down_policy_type
  asp_scale_up_policy_enabled          = var.asp_scale_up_policy_enabled
  alarm_scale_down_description         = var.alarm_scale_down_description
  alarm_scale_dowm_name                = var.alarm_scale_dowm_name
  alarm_scale_dowm_comparison_operator = var.alarm_scale_dowm_comparison_operator
  alarm_scale_down_namespace           = var.alarm_scale_down_namespace
  alarm_scale_down_metric_name         = var.alarm_scale_down_metric_name
  alarm_scale_down_threshold           = var.alarm_scale_down_threshold
  alarm_scale_down_evaluation_periods  = var.alarm_scale_down_evaluation_periods
  alarm_scale_down_period              = var.alarm_scale_down_period
  alarm_scale_down_statistic           = var.alarm_scale_down_statistic
  alarm_scale_down_actions_enabled     = var.alarm_scale_down_actions_enabled
  alarm_scale_up_description           = var.alarm_scale_up_description
  alarm_scale_up_name                  = var.alarm_scale_up_name
  alarm_scale_up_comparison_operator   = var.alarm_scale_up_comparison_operator
  alarm_scale_up_namespace             = var.alarm_scale_up_namespace
  alarm_scale_up_metric_name           = var.alarm_scale_up_metric_name
  alarm_scale_up_threshold             = var.alarm_scale_up_threshold
  alarm_scale_up_evaluation_periods    = var.alarm_scale_up_evaluation_periods
  alarm_scale_up_period                = var.alarm_scale_up_period
  alarm_scale_up_statistic             = var.alarm_scale_up_statistic
  alarm_scale_up_actions_enabled       = var.alarm_scale_up_actions_enabled
  asg_termination_policies             = var.asg_termination_policies
  asg_force_delete                     = var.asg_force_delete
}

module "dns_record" {
  source = "../modules/services/dnsRecord"
  depends_on = [
    module.load_balancer
  ]
  alias_domain_name = var.alias_domain_name
  alias_record_type = var.alias_record_type
  lb-dns-name-in    = module.load_balancer.lb-dns-name-out
  lb-zone-id-in     = module.load_balancer.lb-zone-id-out
  hosted_zone_name  = var.hosted_zone_name
  private_zone      = var.private_zone
}