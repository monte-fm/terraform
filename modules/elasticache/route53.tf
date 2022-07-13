resource "aws_route53_record" "redis" {
  name           = "${var.environment}-${var.stack}-redis"
  zone_id        = var.route53_zone_id
  type           = "CNAME"
  set_identifier = "${var.environment}-${var.stack}-redis"
  ttl            = 60

  weighted_routing_policy {
    weight = 100
  }

  records = [aws_elasticache_replication_group.redis.primary_endpoint_address]
}
