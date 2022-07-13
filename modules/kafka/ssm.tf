resource "aws_ssm_parameter" "kafka_zookeeper" {
  name  = "/${var.environment}/kafka/zookeeper"
  type  = "String"
  value = aws_msk_cluster.kafka.zookeeper_connect_string
}

resource "aws_ssm_parameter" "kafka_brokers" {
  name  = "/${var.environment}/kafka/brokers"
  type  = "String"
  value = aws_msk_cluster.kafka.bootstrap_brokers
}
