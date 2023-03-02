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

variable "sg_name" {
  type        = string
  description = "Security Group Name Reference"
  default     = "application"
}

variable "vpc-id-in" {}

variable "sg-id-in" {
  type        = string
  description = "ID input of another security group"
  default     = null
}

variable "sg_egress_ports" {
  type        = list(number)
  description = "list of security group egress ports"
  default     = []
}
variable "sg_egress_cidr" {
  type        = list(string)
  description = "egress cidr block"
  default     = []
}