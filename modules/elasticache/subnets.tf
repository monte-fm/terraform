data "aws_subnets" "subnets" {
  depends_on = [data.aws_ssm_parameter.vpc_id]
  filter {
    name   = "vpc-id"
    values = [data.aws_ssm_parameter.vpc_id.value]
  }
  filter {
    name   = "tag:Name"
    values = ["Private subnet for ${var.environment}"]
  }
}
