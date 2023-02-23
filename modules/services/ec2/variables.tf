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