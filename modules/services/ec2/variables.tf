variable "env" {
  type        = string
  description = "Environment"
  default     = "production"
}
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
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

variable "s3-bucket-name-in" {}

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

variable "vpc-public-subnet-id-in" {}

variable "ec2-security-group-id-in" {}

variable "db-instance-host-in" {}
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

variable "rds_dialect" {
  type        = string
  description = "RDS Instance Dialect"
  default     = "mysql"
}

variable "ec2_iam_profile_name" {
  type        = string
  description = "EC2 IAM Profile Name"
  default     = "ec2-instance-profile"
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