variable "vpc-all-public-subnet-id-in" {}

variable "launch-template-id-in" {}

variable "lb-target-group-arn-in" {}

variable "asg_name" {
  type        = string
  description = "Auto Scaling Group Name"
  default     = "csye6225-asg"
}

variable "asg_desired_capacity" {
  type        = number
  description = "Auto Scaling Group Desired Instance Capacity"
  default     = 1
}

variable "asg_max_size" {
  type        = number
  description = "Auto Scaling Group Max Number of Instances"
  default     = 3
}

variable "asg_min_size" {
  type        = number
  description = "Auto Scaling Group Max Number of Instances"
  default     = 1
}

variable "asg_default_cooldown" {
  type        = number
  description = "Auto Scaling Default Cool Down"
  default     = 60
}

variable "asg_health_check_grace_period" {
  type        = number
  description = "Auto Scaling Health Check Grace Period"
  default     = 60
}

variable "asg_health_check_type" {
  type        = string
  description = "Auto Scaling Group Health Check Type"
  default     = "EC2"
}

variable "asg_tag_key" {
  type        = string
  description = "Auto Scaling Group Tag Key"
  default     = "Type"
}

variable "asg_tag_value" {
  type        = string
  description = "Auto Scaling Group Tag Value"
  default     = "auto_sg_ec2_instance"
}

variable "asg_tag_propagate_at_launch" {
  type        = bool
  description = "Auto Scaling Group Tag Propogate At Launch"
  default     = true
}

variable "asg_launch_template_version" {
  type        = string
  description = "Auto Scaling Group Launch Template Version"
  default     = "$Latest"
}

variable "asp_scale_down_name" {
  type        = string
  description = "Auto Scaling Policy Name"
  default     = "custom_scale_down_policy"
}

variable "asp_scale_down_adjustment_type" {
  type        = string
  description = "Auto Scaling Policy Scale Down Adjustment Type"
  default     = "ChangeInCapacity"
}

variable "asp_scale_down_scaling_adjustment" {
  type        = number
  description = "Auto Scaling Policy Scale Down Scaling Adjustment"
  default     = -1
}

variable "asp_scale_down_cooldown" {
  type        = number
  description = "Auto Scaling Policy Scale Down Cooldown"
  default     = 60
}

variable "asp_scale_down_policy_type" {
  type        = string
  description = "Auto Scaling Policy Scale Down Policy Type"
  default     = "SimpleScaling"
}

variable "asp_scale_down_policy_enabled" {
  type        = bool
  description = "Auto Scaling Policy Scale Down Policy Enabled or No"
  default     = true
}

variable "asp_scale_up_name" {
  type        = string
  description = "Auto Scaling Policy Name"
  default     = "custom_scale_up_policy"
}

variable "asp_scale_up_adjustment_type" {
  type        = string
  description = "Auto Scaling Policy Scale Up Adjustment Type"
  default     = "ChangeInCapacity"
}

variable "asp_scale_up_scaling_adjustment" {
  type        = number
  description = "Auto Scaling Policy Scale Up Scaling Adjustment"
  default     = 1
}

variable "asp_scale_up_cooldown" {
  type        = number
  description = "Auto Scaling Policy Scale Up Cooldown"
  default     = 60
}

variable "asp_scale_up_policy_type" {
  type        = string
  description = "Auto Scaling Policy Scale Up Policy Type"
  default     = "SimpleScaling"
}

variable "asp_scale_up_policy_enabled" {
  type        = bool
  description = "Auto Scaling Policy Scale Up Policy Enabled or No"
  default     = true
}

variable "alarm_scale_down_description" {
  type        = string
  description = "CloudWatch Scale Down Alarm Description"
  default     = "Monitors CPU utilization for ASG"
}

variable "alarm_scale_dowm_name" {
  type        = string
  description = "CloudWatch Scale Down Alarm Name"
  default     = "auto_scale_down"
}

variable "alarm_scale_dowm_comparison_operator" {
  type        = string
  description = "CloudWatch Scale Down Alarm Comparison Operator"
  default     = "LessThanOrEqualToThreshold"
}

variable "alarm_scale_down_namespace" {
  type        = string
  description = "CloudWatch Scale Down Namespace"
  default     = "AWS/EC2"
}

variable "alarm_scale_down_metric_name" {
  type        = string
  description = "Alarm scale down metric name"
  default     = "CPUUtilization"
}

variable "alarm_scale_down_threshold" {
  type        = number
  description = "Alarm scale down threshold"
  default     = 3
}

variable "alarm_scale_down_evaluation_periods" {
  type        = number
  description = "Alarm scale down evaluation periods"
  default     = 2
}

variable "alarm_scale_down_period" {
  type        = number
  description = "Alarm scale down period"
  default     = 60
}

variable "alarm_scale_down_statistic" {
  type        = string
  description = "Alarm Scale Down Statistic"
  default     = "Average"
}

variable "alarm_scale_down_actions_enabled" {
  type        = bool
  description = "Alarm Scale Down Actions Enabled"
  default     = true
}

variable "alarm_scale_up_description" {
  type        = string
  description = "CloudWatch Scale Up Alarm Description"
  default     = "Monitors Upper Bound CPU utilization for ASG"
}

variable "alarm_scale_up_name" {
  type        = string
  description = "CloudWatch Scale Up Alarm Name"
  default     = "auto_scale_up"
}

variable "alarm_scale_up_comparison_operator" {
  type        = string
  description = "CloudWatch Scale Up Alarm Comparison Operator"
  default     = "GreaterThanOrEqualToThreshold"
}

variable "alarm_scale_up_namespace" {
  type        = string
  description = "CloudWatch Scale Up Namespace"
  default     = "AWS/EC2"
}

variable "alarm_scale_up_metric_name" {
  type        = string
  description = "Alarm scale up metric name"
  default     = "CPUUtilization"
}

variable "alarm_scale_up_threshold" {
  type        = number
  description = "Alarm scale up threshold"
  default     = 5
}

variable "alarm_scale_up_evaluation_periods" {
  type        = number
  description = "Alarm scale up evaluation periods"
  default     = 2
}

variable "alarm_scale_up_period" {
  type        = number
  description = "Alarm scale up period"
  default     = 60
}

variable "alarm_scale_up_statistic" {
  type        = string
  description = "Alarm Scale Down Statistic"
  default     = "Average"
}

variable "alarm_scale_up_actions_enabled" {
  type        = bool
  description = "Alarm Scale up Actions Enabled"
  default     = true
}

variable "asg_termination_policies" {
  type = list(string)
  description = "Termination Policy for Auto Scaling Group"
  default = ["OldestLaunchTemplate", "OldestInstance"]
}