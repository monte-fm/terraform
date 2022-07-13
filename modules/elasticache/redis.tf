resource "aws_elasticache_subnet_group" "redis_subnet" {
  depends_on = [data.aws_subnets.subnets]
  name       = "${var.environment}-${var.stack}-subnet"
  subnet_ids = data.aws_subnets.subnets.ids
}

resource "aws_elasticache_replication_group" "redis" {
  depends_on = [
    aws_elasticache_subnet_group.redis_subnet,
    aws_security_group.redis_elasticache,
  ]
  replication_group_id       = "${var.environment}-${var.stack}"
  description                = "${var.environment}-${var.stack} redis"
  node_type                  = var.redis_node_type
  port                       = 6379
  engine_version             = var.engine_version
  parameter_group_name       = var.parameter_group_name
  subnet_group_name          = aws_elasticache_subnet_group.redis_subnet.name
  security_group_ids         = [aws_security_group.redis_elasticache.id]
  automatic_failover_enabled = true
  num_node_groups            = var.redis_cluster_size
  replicas_per_node_group    = var.replicas_size

  tags = {
    Name  = "${var.environment}-${var.stack} redis"
    ENV   = "${var.environment}"
    Stack = "${var.stack}"
  }
}
