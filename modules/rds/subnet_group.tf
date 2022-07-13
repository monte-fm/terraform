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

resource "aws_db_subnet_group" "rds_subnet_group" {
  depends_on = [data.aws_subnets.subnets]
  name       = "${var.environment}-${var.stack}-${var.rds_name}"
  subnet_ids = data.aws_subnets.subnets.ids

  tags = {
    Name = "${var.environment}-${var.stack}-${var.rds_name}"
    ENV  = "${var.environment}-${var.stack}"
  }
}
