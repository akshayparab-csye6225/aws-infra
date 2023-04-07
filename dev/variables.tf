variable "env" {
  type        = string
  description = "Environment"
  default     = "dev"
}

variable "aws_profile" {
  type        = string
  description = "AWS User Profile"
  default     = "dev"
}
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block"
  default     = "10.1.0.0/16"
}

variable "ig_cidr_block" {
  type        = string
  description = "IG CIDR Block"
  default     = "0.0.0.0/0"
}

variable "azs" {
  type        = list(string)
  description = "Availibility Zones"
  default     = ["us-east-1a", "us-east-1d", "us-east-1e"]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.1.4.0/24", "10.1.5.0/24", "10.1.7.0/24"]
}

variable "ami_owner_id" {
  type        = string
  description = "ID of AWS Account who owns the AMI"
  default     = "550905456546"
}

variable "ami_name_regex" {
  type        = string
  description = "AMI Name Regex"
  default     = "csye6225_*"
}

variable "protocol" {
  description = "protocol"
  type        = map(string)
  default = {
    tcp = "tcp",
  }
}

variable "tcp_ingress_ports" {
  type        = list(number)
  description = "list of tcp ingress ports"
  default     = [3001]
}

variable "tcp_ingress_cidr" {
  type        = list(string)
  description = "tcp ingress cidr block"
  default     = null
}

variable "ami_id" {
  type        = string
  description = "Value of AMI ID of AMI which will be the base image for EC2"
  default     = null
}

variable "ec2_instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate public ip address to ec2"
  default     = true
}

variable "disable_api_termination" {
  type        = bool
  description = "Protect against accidental termination"
  default     = false
}

variable "root_volume_size" {
  type        = number
  description = "EC2 Volume Size"
  default     = 50
}

variable "root_volume_type" {
  type        = string
  description = "EC2 Volume Type"
  default     = "gp2"
}

variable "root_volume_delete_on_termination" {
  type        = bool
  description = "To Delete Root Volume On Termination"
  default     = true
}

variable "vpc-public-subnet-id-in" {
  type        = string
  description = "id of public subnet id from custom vpc"
  default     = "#"
}

variable "ec2-security-group-id-in" {
  type        = string
  description = "id of custom security group"
  default     = "#"
}

variable "vpc-id-in" {
  type        = string
  description = "ID of Custom VPC"
  default     = "#"
}

variable "sg_name" {
  type        = string
  description = "Security Group Name Reference"
  default     = "application"
}

variable "sg-id-in" {
  type        = string
  description = "ID input of another security group"
  default     = null
}

variable "db_sg_name" {
  type        = string
  description = "Name of security group for rds"
  default     = "database"
}

variable "db_tcp_ingress_ports" {
  type        = list(number)
  description = "list of tcp ingress ports"
  default     = [3306]
}

variable "db_sg_protocol" {
  description = "protocol"
  type        = map(string)
  default = {
    tcp = "tcp",
  }
}

variable "db_tcp_ingress_cidr" {
  type        = list(string)
  description = "tcp ingress cidr block"
  default     = null
}

variable "aws_db_parameter_group_family" {
  type        = string
  description = "AWS DB Parameter Group Family"
  default     = "mysql8.0"
}

variable "rds_instance_engine" {
  type        = string
  description = "AWS RDS Instance Engine"
  default     = "mysql"
}

variable "rds_instance_engine_version" {
  type        = string
  description = "AWS RDS Instance Engine Version"
  default     = "8.0"
}

variable "rds_instance_class" {
  type        = string
  description = "AWS RDS Instance Class"
  default     = "db.t3.micro"
}

variable "rds_instance_identifier" {
  type        = string
  description = "AWS RDS Instance Identifier"
  default     = "csye6225"
}

variable "rds_instance_name" {
  type        = string
  description = "AWS RDS Instance Name"
  default     = "csye6225"
}

variable "rds_instance_port" {
  type        = number
  description = "AWS RDS Instance Port"
  default     = 3306
}

variable "rds_instance_username" {
  type        = string
  description = "AWS RDS Instance Username"
  default     = "csye6225"
}

variable "rds_instance_password" {
  type        = string
  description = "AWS RDS Instance Password"
  default     = "K#2hA7%Lx9#p"
}

variable "rds_instance_skip_final_snapshot" {
  type        = bool
  description = "AWS RDS Whether to skip final snapshot"
  default     = true
}

variable "rds_instance_publicly_accessible" {
  type        = bool
  description = "AWS RDS Whether Publicly Accessible"
  default     = false
}

variable "rds_instance_multi_az" {
  type        = bool
  description = "AWS RDS Whether Multi AZ Deployment"
  default     = false
}

variable "rds_instance_storage" {
  type        = number
  description = "AWS RDS Instance Allocated Storage"
  default     = 10
}

variable "acl" {
  type        = string
  description = "s3 bucket acl"
  default     = "private"
}

variable "s3_force_destroy" {
  type        = bool
  description = "force destroy s3 bucket"
  default     = false
}

variable "sse_algorithm" {
  type        = string
  description = "server side encryption algorithm"
  default     = "AES256"
}

variable "transition_to_ia_id" {
  type        = string
  description = "id for lifecycle rule to transition from standard to standard_ia"
  default     = "transition-to-ia"
}

variable "transition_to_ia_status" {
  type        = string
  description = "status of lifecycle rule to transition from standard to standard_ia"
  default     = "Enabled"
}

variable "transition_to_ia_transition_duration" {
  type        = number
  description = "duration of lifecycle rule to transition from standard to standard_ia"
  default     = 30
}

variable "transition_to_ia_transition_storage_class" {
  type        = string
  description = "storage_class of lifecycle rule to transition from standard to standard_ia"
  default     = "STANDARD_IA"
}

variable "aws_iam_policy_name" {
  type        = string
  description = "AWS IAM Policy Name"
  default     = "WebAppS3"
}

variable "aws_iam_policy_action" {
  type        = list(string)
  description = "AWS IAM Policy Action for S3"
  default     = ["s3:Put*", "s3:Delete*"]
}

variable "aws_iam_role_name" {
  type        = string
  description = "AWS IAM Role Name"
  default     = "EC2-CSYE6225"
}

variable "s3-bucket-name-in" {
  type        = string
  description = "S3 Bucket"
  default     = null
}

variable "sg_egress_ports" {
  type        = list(number)
  description = "list of security group egress ports"
  default     = [0]
}
variable "sg_egress_cidr" {
  type        = list(string)
  description = "egress cidr block"
  default     = []
}

variable "app_sg_egress_ports" {
  type        = list(number)
  description = "list of security group egress ports"
  default     = [0]
}
variable "app_sg_egress_cidr" {
  type        = list(string)
  description = "egress cidr block"
  default     = ["0.0.0.0/0"]
}

variable "envfilePath" {
  type        = string
  description = ".env file path for web server"
  default     = "/home/ec2-user/webapp/.env"
}

variable "server_port" {
  type        = number
  description = "Port on which web server will run"
  default     = 3001
}

variable "db-instance-host-in" {
  type        = string
  description = "RDS Instance Host"
  default     = "localhost"
}

variable "rds_dialect" {
  type        = string
  description = "RDS Instance Dialect"
  default     = "mysql"
}

variable "db-security-group-id-in" {
  type        = string
  description = "id of custom db security group"
  default     = "#"
}

variable "ec2_iam_profile_name" {
  type        = string
  description = "EC2 IAM Profile Name"
  default     = "ec2-instance-profile"
}

variable "s3_versioning_configuration" {
  type        = string
  description = "s3 versioning configuration"
  default     = "Disabled"
}

variable "hosted_zone_name" {
  type        = string
  description = "ID of Hosted Zone"
  default     = "dev.akshayparab.me"
}

variable "private_zone" {
  type        = bool
  description = "Is hosted zone private"
  default     = false
}

variable "hosted_zone_domain_name" {
  type        = string
  description = "Domain Name"
  default     = "dev.akshayparab.me"
}

variable "hosted_zone_record_type" {
  type        = string
  description = "Record Type"
  default     = "A"
}

variable "hosted_zone_record_ttl" {
  type        = string
  description = "TTL of Record"
  default     = "60"
}

variable "allow_overwrite_record" {
  type        = bool
  description = "Allow overwrite record"
  default     = true
}

variable "createAlias" {
  type        = bool
  description = "To create alias or no"
  default     = true
}

variable "alias_record_type" {
  type        = string
  description = "Alias Record Type"
  default     = "A"
}

variable "alias_domain_name" {
  type        = string
  description = "Alias Domain Name"
  default     = "dev.akshayparab.me"
}

variable "ec2-public-ip-in" {
  type        = string
  description = "Public IP of EC2 Instance"
  default     = "127.0.0.1"
}

variable "statsd_host" {
  type        = string
  description = "statsd host"
  default     = "localhost"
}

variable "statsd_port" {
  type        = number
  description = "statsd port"
  default     = 8125
}

variable "aws_iam_cw_policy_name" {
  type        = string
  description = "AWS IAM CW Policy Name"
  default     = "CloudWatchAgentServerPolicy"
}


variable "lb_sg_name" {
  type        = string
  description = "Load Balancer Security Group Name"
  default     = "load balancer"
}

variable "lb_ingress_ports" {
  type        = list(number)
  description = "list of tcp ingress ports"
  default     = [80, 443]
}

variable "lb_sg_protocol" {
  description = "protocol"
  type        = map(string)
  default = {
    tcp = "tcp",
  }
}

variable "lb_ingress_cidr" {
  type        = list(string)
  description = "tcp ingress cidr block"
  default     = ["0.0.0.0/0"]
}

variable "lb_sg_egress_ports" {
  type        = list(number)
  description = "list of security group egress ports"
  default     = [0]
}
variable "lb_sg_egress_cidr" {
  type        = list(string)
  description = "egress cidr block"
  default     = ["0.0.0.0/0"]
}

variable "lb-sg-id-in" {
  type        = string
  description = "Load Balancer Security Group Id"
  default     = "#"
}

variable "vpc-all-public-subnet-id-in" {
  type        = list(string)
  description = "Subnet Ids of all public subnets"
  default     = ["value"]
}

variable "launch-template-id-in" {
  type        = string
  description = "Launch Template Id"
  default     = "#"
}
variable "lb-target-group-arn-in" {
  type        = string
  description = "Load Balancer Target Group ARN"
  default     = "#"
}

variable "lb-dns-name-in" {
  type        = string
  description = "Load Balancer DNS Name"
  default     = "#"
}

variable "lb-zone-id-in" {
  type        = string
  description = "Load Balancer Zone Id"
  default     = "#"
}

variable "lb_name" {
  type        = string
  description = "Name of Load Balancer"
  default     = "csye6225-lb"
}

variable "lb_internal" {
  type        = bool
  description = "Whether Load Balancer is Internal or Internet-Facing"
  default     = false
}

variable "lb_type" {
  type        = string
  description = "Type of Load Balancer"
  default     = "application"
}

variable "lb_ip_address_type" {
  type        = string
  description = "IP Address type for Load Balancer"
  default     = "ipv4"
}

variable "lb_tg_name_prefix" {
  type        = string
  description = "Name of Load Balancer Target Group"
  default     = "lbTg-"
}

variable "lb_tg_target_type" {
  type        = string
  description = "Target Type of Load Balancer Target Group"
  default     = "instance"
}

variable "lb_tg_port" {
  type        = number
  description = "Port that Load Balancer Target Group is using"
  default     = 3001
}

variable "lb_tg_protocol" {
  type        = string
  description = "Protocol that Load Balancer Target Group is Using"
  default     = "HTTP"
}

variable "lb_tg_protocol_version" {
  type        = string
  description = "Protocol Version that Load Balancer Target Group is Using"
  default     = "HTTP1"
}

variable "lb_tg_healthcheck_enabled" {
  type        = bool
  description = "Load Balancer Healthcheck To Enabled or No"
  default     = true
}

variable "lb_tg_healthcheck_path" {
  type        = string
  description = "HealthCheck Path"
  default     = "/healthz"
}

variable "lb_tg_healthcheck_port" {
  type        = string
  description = "Load Balancer Healthcheck Port"
  default     = "traffic-port"
}

variable "lb_tg_healthcheck_protocol" {
  type        = string
  description = "Load Balancer Healthcheck Protocol"
  default     = "HTTP"
}

variable "lb_tg_healthcheck_timeout" {
  type        = number
  description = "Load Balancer Healthcheck Timeout"
  default     = 6
}

variable "lb_tg_healthcheck_interval" {
  type        = number
  description = "Load Balancer Healthcheck Interval"
  default     = 30
}

variable "lb_tg_healthcheck_healthy_threshold" {
  type        = number
  description = "Load Balancer Healthcheck Healthy Threshold"
  default     = 3
}

variable "lb_tg_healthcheck_unhealthy_threshold" {
  type        = number
  description = "Load Balancer Healthcheck Unhealthy Threshold"
  default     = 3
}

variable "lb_listener_port" {
  type        = number
  description = "Load Balancer Listener Port"
  default     = 80
}

variable "lb_listener_protocol" {
  type        = string
  description = "Load Balancer Listener Protocol"
  default     = "HTTP"
}

variable "lb_listener_default_action_type" {
  type        = string
  description = "Load Balancer Default Action Type"
  default     = "forward"
}

variable "asg_name" {
  type        = string
  description = "Auto Scaling Group Name"
  default     = "csye6225-asg"
}

variable "asg_desired_capacity" {
  type        = number
  description = "Auto Scaling Group Desired Instance Capacity"
  default     = 1
}

variable "asg_max_size" {
  type        = number
  description = "Auto Scaling Group Max Number of Instances"
  default     = 3
}

variable "asg_min_size" {
  type        = number
  description = "Auto Scaling Group Max Number of Instances"
  default     = 1
}

variable "asg_default_cooldown" {
  type        = number
  description = "Auto Scaling Default Cool Down"
  default     = 60
}

variable "asg_health_check_grace_period" {
  type        = number
  description = "Auto Scaling Health Check Grace Period"
  default     = 60
}

variable "asg_health_check_type" {
  type        = string
  description = "Auto Scaling Group Health Check Type"
  default     = "EC2"
}

variable "asg_tag_key" {
  type        = string
  description = "Auto Scaling Group Tag Key"
  default     = "Type"
}

variable "asg_tag_value" {
  type        = string
  description = "Auto Scaling Group Tag Value"
  default     = "auto_sg_ec2_instance"
}

variable "asg_tag_propagate_at_launch" {
  type        = bool
  description = "Auto Scaling Group Tag Propogate At Launch"
  default     = true
}

variable "asg_launch_template_version" {
  type        = string
  description = "Auto Scaling Group Launch Template Version"
  default     = "$Latest"
}

variable "asp_scale_down_name" {
  type        = string
  description = "Auto Scaling Policy Name"
  default     = "custom_scale_down_policy"
}

variable "asp_scale_down_adjustment_type" {
  type        = string
  description = "Auto Scaling Policy Scale Down Adjustment Type"
  default     = "ChangeInCapacity"
}

variable "asp_scale_down_scaling_adjustment" {
  type        = number
  description = "Auto Scaling Policy Scale Down Scaling Adjustment"
  default     = -1
}

variable "asp_scale_down_cooldown" {
  type        = number
  description = "Auto Scaling Policy Scale Down Cooldown"
  default     = 60
}

variable "asp_scale_down_policy_type" {
  type        = string
  description = "Auto Scaling Policy Scale Down Policy Type"
  default     = "SimpleScaling"
}

variable "asp_scale_down_policy_enabled" {
  type        = bool
  description = "Auto Scaling Policy Scale Down Policy Enabled or No"
  default     = true
}

variable "asp_scale_up_name" {
  type        = string
  description = "Auto Scaling Policy Name"
  default     = "custom_scale_up_policy"
}

variable "asp_scale_up_adjustment_type" {
  type        = string
  description = "Auto Scaling Policy Scale Up Adjustment Type"
  default     = "ChangeInCapacity"
}

variable "asp_scale_up_scaling_adjustment" {
  type        = number
  description = "Auto Scaling Policy Scale Up Scaling Adjustment"
  default     = 1
}

variable "asp_scale_up_cooldown" {
  type        = number
  description = "Auto Scaling Policy Scale Up Cooldown"
  default     = 60
}

variable "asp_scale_up_policy_type" {
  type        = string
  description = "Auto Scaling Policy Scale Up Policy Type"
  default     = "SimpleScaling"
}

variable "asp_scale_up_policy_enabled" {
  type        = bool
  description = "Auto Scaling Policy Scale Up Policy Enabled or No"
  default     = true
}

variable "alarm_scale_down_description" {
  type        = string
  description = "CloudWatch Scale Down Alarm Description"
  default     = "Monitors CPU utilization for ASG"
}

variable "alarm_scale_dowm_name" {
  type        = string
  description = "CloudWatch Scale Down Alarm Name"
  default     = "auto_scale_down"
}

variable "alarm_scale_dowm_comparison_operator" {
  type        = string
  description = "CloudWatch Scale Down Alarm Comparison Operator"
  default     = "LessThanOrEqualToThreshold"
}

variable "alarm_scale_down_namespace" {
  type        = string
  description = "CloudWatch Scale Down Namespace"
  default     = "AWS/EC2"
}

variable "alarm_scale_down_metric_name" {
  type        = string
  description = "Alarm scale down metric name"
  default     = "CPUUtilization"
}

variable "alarm_scale_down_threshold" {
  type        = number
  description = "Alarm scale down threshold"
  default     = 3
}

variable "alarm_scale_down_evaluation_periods" {
  type        = number
  description = "Alarm scale down evaluation periods"
  default     = 2
}

variable "alarm_scale_down_period" {
  type        = number
  description = "Alarm scale down period"
  default     = 60
}

variable "alarm_scale_down_statistic" {
  type        = string
  description = "Alarm Scale Down Statistic"
  default     = "Average"
}

variable "alarm_scale_down_actions_enabled" {
  type        = bool
  description = "Alarm Scale Down Actions Enabled"
  default     = true
}

variable "alarm_scale_up_description" {
  type        = string
  description = "CloudWatch Scale Up Alarm Description"
  default     = "Monitors Upper Bound CPU utilization for ASG"
}

variable "alarm_scale_up_name" {
  type        = string
  description = "CloudWatch Scale Up Alarm Name"
  default     = "auto_scale_up"
}

variable "alarm_scale_up_comparison_operator" {
  type        = string
  description = "CloudWatch Scale Up Alarm Comparison Operator"
  default     = "GreaterThanOrEqualToThreshold"
}

variable "alarm_scale_up_namespace" {
  type        = string
  description = "CloudWatch Scale Up Namespace"
  default     = "AWS/EC2"
}

variable "alarm_scale_up_metric_name" {
  type        = string
  description = "Alarm scale up metric name"
  default     = "CPUUtilization"
}

variable "alarm_scale_up_threshold" {
  type        = number
  description = "Alarm scale up threshold"
  default     = 5
}

variable "alarm_scale_up_evaluation_periods" {
  type        = number
  description = "Alarm scale up evaluation periods"
  default     = 2
}

variable "alarm_scale_up_period" {
  type        = number
  description = "Alarm scale up period"
  default     = 60
}

variable "alarm_scale_up_statistic" {
  type        = string
  description = "Alarm Scale Down Statistic"
  default     = "Average"
}

variable "alarm_scale_up_actions_enabled" {
  type        = bool
  description = "Alarm Scale up Actions Enabled"
  default     = true
}

variable "asg_termination_policies" {
  type        = list(string)
  description = "Termination Policy for Auto Scaling Group"
  default     = ["OldestLaunchTemplate", "OldestInstance"]
}

variable "lb_algo_type" {
  type        = string
  description = "Load Balancer Algorithm Type"
  default     = "round_robin"
}

variable "launch_template_name_prefix" {
  type        = string
  description = "Launch Template Name"
  default     = "csye6225-lt-"
}