resource "aws_route53_zone" "route53_zone" {
  count = var.create_dns_zone ? 1 : 0
  name  = var.domain
}

data "aws_route53_zone" "primary" {
  count = var.create_dns_zone ? 0 : 1
  name  = var.domain
}

locals {
  dns_zone_id = var.create_dns_zone ? aws_route53_zone.route53_zone[0].zone_id : data.aws_route53_zone.primary[0].zone_id
  subdomain   = var.environment_name == "prod" ? "" : "${var.environment_name}."
}

resource "aws_route53_record" "route53_record" {
  zone_id = local.dns_zone_id
  name    = "${local.subdomain}${var.domain}"
  type    = "A"
  records = [aws_instance.EC2-WebApp.public_ip]
  ttl     = "300"

}