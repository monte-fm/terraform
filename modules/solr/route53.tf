resource "aws_route53_record" "dns" {
  depends_on     = [aws_eip.eip]
  name           = var.dns_name
  zone_id        = var.zone_id
  type           = "CNAME"
  set_identifier = var.dns_name
  records        = [aws_eip.eip.public_dns]
  ttl            = 60
  weighted_routing_policy {
    weight = 100
  }
}
