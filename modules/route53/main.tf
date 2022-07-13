resource "aws_route53_record" "dns" {
  name           = var.dns_name
  zone_id        = var.zone_id
  type           = "CNAME"
  set_identifier = var.dns_name
  records        = [var.dns_target]
  ttl            = 60
  weighted_routing_policy {
    weight = 100
  }
}
