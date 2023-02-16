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

  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.aws_region))
    error_message = "Must be valid AWS Region name"
  }
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block"
  default     = "10.1.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr_block, 0))
    error_message = "Must be valid IPv4 CIDR."
  }
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

  validation {
    condition     = can([for az in var.azs : regex("^[a-z][a-z]-[a-z]+-[1-9][a-z]$", az)])
    error_message = "Each item in the 'azs' must be valid AWS Availability Zone name"
  }
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]

  validation {
    condition     = can([for cidr in var.public_subnet_cidrs : cidrhost(cidr, 0)])
    error_message = "Each item of the 'public_subnet_cidrs' list must be in a CIDR block format"
  }
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.1.4.0/24", "10.1.5.0/24", "10.1.7.0/24"]

  validation {
    condition     = length(var.private_subnet_cidrs) > 0
    error_message = "There should be at least one item in 'private_subnet_cidrs'"
  }

  validation {
    condition     = can([for cidr in var.private_subnet_cidrs : cidrhost(cidr, 0)])
    error_message = "Each item of the 'private_subnet_cidrs' list must be in a CIDR block format"
  }
}
