variable "env" {
  type        = string
  description = "Environment"
  default     = "development"
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
