output "dns_name" {
  value = aws_elasticache_replication_group.redis.configuration_endpoint_address
}
