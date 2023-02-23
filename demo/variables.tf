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
  default     = "us-east-2"
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