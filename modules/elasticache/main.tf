data "aws_vpc" "main" {
  depends_on = [data.aws_ssm_parameter.vpc_id]
  id         = data.aws_ssm_parameter.vpc_id.value
}
