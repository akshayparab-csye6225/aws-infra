output "lb-target-group-arn-out" {
  value = aws_lb_target_group.alb_tg.arn
}

output "lb-dns-name-out" {
  value = aws_lb.lb.dns_name
}

output "lb-zone-id-out" {
  value = aws_lb.lb.zone_id
}