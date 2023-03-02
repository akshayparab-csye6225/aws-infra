variable "env" {
  type        = string
  description = "Environment"
  default     = "dev"
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

variable "s3_versioning_configuration" {
  type        = bool
  description = "s3 versioning configuration"
  default     = "Disabled"
}