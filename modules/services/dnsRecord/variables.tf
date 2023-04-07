variable "hosted_zone_name" {
  type        = string
  description = "Name of Hosted Zone"
  default     = "prod.akshayparab.me"
}

variable "private_zone" {
  type        = bool
  description = "Is hosted zone private"
  default     = false
}

variable "hosted_zone_domain_name" {
  type        = string
  description = "Domain Name"
  default     = "prod.akshayparab.me"
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
  default     = false
}

variable "alias_record_type" {
  type        = string
  description = "Alias Record Type"
  default     = "A"
}

variable "alias_domain_name" {
  type        = string
  description = "Alias Domain Name"
  default     = "www"
}

variable "ec2-public-ip-in" {
  type        = string
  description = "Public IP of EC2 Instance"
  default     = "127.0.0.1"
}

variable "lb-dns-name-in" {}

variable "lb-zone-id-in" {}