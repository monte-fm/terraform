output "rw_domain" {
  value = aws_rds_cluster.default.endpoint
}

output "ro_domain" {
  value = aws_rds_cluster.default.reader_endpoint
}
