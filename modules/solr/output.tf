output "solr_dns" {
  value = aws_route53_record.dns.fqdn
}
