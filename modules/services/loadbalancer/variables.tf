variable "lb-sg-id-in" {}

variable "vpc-id-in" {}

variable "vpc-all-public-subnet-id-in" {}

variable "lb_name" {
  type        = string
  description = "Name of Load Balancer"
  default     = "csye6225-lb"
}

variable "lb_internal" {
  type        = bool
  description = "Whether Load Balancer is Internal or Internet-Facing"
  default     = false
}

variable "lb_type" {
  type        = string
  description = "Type of Load Balancer"
  default     = "application"
}

variable "lb_ip_address_type" {
  type        = string
  description = "IP Address type for Load Balancer"
  default     = "ipv4"
}

variable "lb_tg_name_prefix" {
  type        = string
  description = "Name of Load Balancer Target Group"
  default     = "lbTg-"
}

variable "lb_tg_target_type" {
  type        = string
  description = "Target Type of Load Balancer Target Group"
  default     = "instance"
}

variable "lb_tg_port" {
  type        = number
  description = "Port that Load Balancer Target Group is using"
  default     = 3001
}

variable "lb_tg_protocol" {
  type        = string
  description = "Protocol that Load Balancer Target Group is Using"
  default     = "HTTP"
}

variable "lb_tg_protocol_version" {
  type        = string
  description = "Protocol Version that Load Balancer Target Group is Using"
  default     = "HTTP1"
}

variable "lb_tg_healthcheck_enabled" {
  type        = bool
  description = "Load Balancer Healthcheck To Enabled or No"
  default     = true
}

variable "lb_tg_healthcheck_path" {
  type        = string
  description = "HealthCheck Path"
  default     = "/healthz"
}

variable "lb_tg_healthcheck_port" {
  type        = string
  description = "Load Balancer Healthcheck Port"
  default     = "traffic-port"
}

variable "lb_tg_healthcheck_protocol" {
  type        = string
  description = "Load Balancer Healthcheck Protocol"
  default     = "HTTP"
}

variable "lb_tg_healthcheck_timeout" {
  type        = number
  description = "Load Balancer Healthcheck Timeout"
  default     = 6
}

variable "lb_tg_healthcheck_interval" {
  type        = number
  description = "Load Balancer Healthcheck Interval"
  default     = 30
}

variable "lb_tg_healthcheck_healthy_threshold" {
  type        = number
  description = "Load Balancer Healthcheck Healthy Threshold"
  default     = 3
}

variable "lb_tg_healthcheck_unhealthy_threshold" {
  type        = number
  description = "Load Balancer Healthcheck Unhealthy Threshold"
  default     = 3
}

variable "lb_listener_port" {
  type        = number
  description = "Load Balancer Listener Port"
  default     = 80
}

variable "lb_listener_protocol" {
  type        = string
  description = "Load Balancer Listener Protocol"
  default     = "HTTP"
}

variable "lb_listener_default_action_type" {
  type        = string
  description = "Load Balancer Default Action Type"
  default     = "forward"
}

variable "lb_algo_type" {
  type        = string
  description = "Load Balancer Algorithm Type"
  default     = "round_robin"
}