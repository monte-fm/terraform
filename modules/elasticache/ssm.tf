data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.environment}/vpc/id"
}

resource "aws_ssm_parameter" "redis_connection_url" {
  name  = "/${var.environment}/${var.stack}/redis/host"
  type  = "String"
  value = aws_elasticache_replication_group.redis.configuration_endpoint_address
}
