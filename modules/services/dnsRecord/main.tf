data "aws_route53_zone" "primary" {
  name         = var.hosted_zone_name
  private_zone = var.private_zone
}
resource "aws_route53_record" "dns_record" {
  zone_id         = data.aws_route53_zone.primary.id
  name            = var.hosted_zone_domain_name
  type            = var.hosted_zone_record_type
  ttl             = var.hosted_zone_record_ttl
  records         = [var.ec2-public-ip-in]
  allow_overwrite = var.allow_overwrite_record
}

resource "aws_route53_record" "alias_record" {
  count   = var.createAlias ? 1 : 0
  zone_id = data.aws_route53_zone.primary.id
  name    = var.alias_domain_name
  type    = var.alias_record_type
  alias {
    name                   = aws_route53_record.dns_record.fqdn
    zone_id                = data.aws_route53_zone.primary.id
    evaluate_target_health = false
  }
}