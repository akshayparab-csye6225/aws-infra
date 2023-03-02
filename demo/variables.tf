variable "env" {
  type        = string
  description = "Environment"
  default     = "production"
}

variable "aws_profile" {
  type        = string
  description = "AWS User Profile"
  default     = "demo"
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
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
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
  default     = [22, 80, 443, 3001]
}

variable "tcp_ingress_cidr" {
  type        = list(string)
  description = "tcp ingress cidr block"
  default     = ["0.0.0.0/0"]
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
  type        = bool
  description = "s3 versioning configuration"
  default     = "Disabled"
}