resource "aws_ssm_parameter" "private_dns_zone_id" {
  name  = "/${var.environment}/private_dns_zone/id"
  type  = "String"
  value = aws_route53_zone.private.id
}
