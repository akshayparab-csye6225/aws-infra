variable "private-subnet-id-in" {
  type        = list(string)
  description = "Custom VPC Private Subnet Ids"
  default     = [null]
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

variable "db-security-group-id-in" {
  type        = string
  description = "id of custom db security group"
  default     = "#"
}

variable "kms_key_description" {
  type        = string
  description = "KMS Key Description"
  default     = "KMS Key for encrypting RDS instance"
}

variable "rds_storage_encrypted" {
  type        = bool
  description = "EDS Storage To Be Encrypted Or No"
  default     = true
}
variable "kms_key_enabled" {
  type        = bool
  description = "Is KMS Key Enabled"
  default     = true
}

variable "aws_user_name" {
  type        = string
  description = "AWS User Name"
  default     = "aws-cli"
}