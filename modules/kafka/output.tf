output "zookeeper_connect_string" {
  description = "Zookeeper connection host:port pairs"
  value       = aws_msk_cluster.kafka.zookeeper_connect_string
}

output "bootstrap_brokers" {
  description = "Brokers connection host:port pairs"
  value       = aws_msk_cluster.kafka.bootstrap_brokers
}
