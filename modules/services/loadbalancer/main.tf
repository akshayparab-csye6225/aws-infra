data "aws_acm_certificate" "issued" {
  domain    = var.acm_cert_issued_domain
  key_types = var.acm_cert_key_types
  statuses  = var.acm_cert_statuses
}

resource "aws_lb" "lb" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = var.lb_type
  ip_address_type    = var.lb_ip_address_type
  security_groups    = [var.lb-sg-id-in]
  subnets            = var.vpc-all-public-subnet-id-in
  tags = {
    Application = "WebAppLB"
  }
}

resource "aws_lb_target_group" "alb_tg" {
  name_prefix                   = var.lb_tg_name_prefix
  vpc_id                        = var.vpc-id-in
  target_type                   = var.lb_tg_target_type
  port                          = var.lb_tg_port
  protocol                      = var.lb_tg_protocol
  protocol_version              = var.lb_tg_protocol_version
  load_balancing_algorithm_type = var.lb_algo_type
  health_check {
    enabled             = var.lb_tg_healthcheck_enabled
    path                = var.lb_tg_healthcheck_path
    port                = var.lb_tg_healthcheck_port
    protocol            = var.lb_tg_healthcheck_protocol
    timeout             = var.lb_tg_healthcheck_timeout
    interval            = var.lb_tg_healthcheck_interval
    healthy_threshold   = var.lb_tg_healthcheck_healthy_threshold
    unhealthy_threshold = var.lb_tg_healthcheck_unhealthy_threshold
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol
  certificate_arn   = data.aws_acm_certificate.issued.arn
  default_action {
    type             = var.lb_listener_default_action_type
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}