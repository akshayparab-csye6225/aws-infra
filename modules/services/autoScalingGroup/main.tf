resource "aws_autoscaling_group" "asg" {
  name                      = var.asg_name
  desired_capacity          = var.asg_desired_capacity
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  default_cooldown          = var.asg_default_cooldown
  vpc_zone_identifier       = var.vpc-all-public-subnet-id-in
  health_check_grace_period = var.asg_health_check_grace_period
  health_check_type         = var.asg_health_check_type
  termination_policies      = var.asg_termination_policies
  force_delete              = var.asg_force_delete
  tag {
    key                 = var.asg_tag_key
    value               = var.asg_tag_value
    propagate_at_launch = var.asg_tag_propagate_at_launch
  }
  launch_template {
    id      = var.launch-template-id-in
    version = var.asg_launch_template_version
  }
  target_group_arns = [var.lb-target-group-arn-in]
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = var.asp_scale_down_name
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = var.asp_scale_down_adjustment_type
  scaling_adjustment     = var.asp_scale_down_scaling_adjustment
  cooldown               = var.asp_scale_down_cooldown
  policy_type            = var.asp_scale_down_policy_type
  enabled                = var.asp_scale_down_policy_enabled
}

resource "aws_cloudwatch_metric_alarm" "scale_down" {
  alarm_description   = var.alarm_scale_down_description
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]
  alarm_name          = var.alarm_scale_dowm_name
  comparison_operator = var.alarm_scale_dowm_comparison_operator
  namespace           = var.alarm_scale_down_namespace
  metric_name         = var.alarm_scale_down_metric_name
  threshold           = var.alarm_scale_down_threshold
  evaluation_periods  = var.alarm_scale_down_evaluation_periods
  period              = var.alarm_scale_down_period
  statistic           = var.alarm_scale_down_statistic

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
  actions_enabled = var.alarm_scale_down_actions_enabled
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = var.asp_scale_up_name
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = var.asp_scale_up_adjustment_type
  scaling_adjustment     = var.asp_scale_up_scaling_adjustment
  cooldown               = var.asp_scale_up_cooldown
  policy_type            = var.asp_scale_up_policy_type
  enabled                = var.asp_scale_up_policy_enabled
}

resource "aws_cloudwatch_metric_alarm" "scale_up" {
  alarm_description   = var.alarm_scale_up_description
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]
  alarm_name          = var.alarm_scale_up_name
  comparison_operator = var.alarm_scale_up_comparison_operator
  namespace           = var.alarm_scale_up_namespace
  metric_name         = var.alarm_scale_up_metric_name
  threshold           = var.alarm_scale_up_threshold
  evaluation_periods  = var.alarm_scale_up_evaluation_periods
  period              = var.alarm_scale_up_period
  statistic           = var.alarm_scale_up_statistic

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
  actions_enabled = var.alarm_scale_up_actions_enabled
}


