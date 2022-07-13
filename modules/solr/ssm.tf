resource "aws_ssm_parameter" "solr_public_ip" {
  depends_on = [aws_eip.eip]
  name       = "/solr/public_ip"
  type       = "String"
  value      = aws_eip.eip.public_ip
}

resource "aws_ssm_parameter" "solr_vpc_id" {
  depends_on = [module.vpc]
  name       = "/solr_vpc/id"
  type       = "String"
  value      = module.vpc.vpc_id
}
