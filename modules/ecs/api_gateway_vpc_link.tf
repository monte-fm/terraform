resource "aws_api_gateway_vpc_link" "api_gateway_vpc_link" {
  name        = "${var.environment}-${var.cluster_name}"
  description = "API gateway VPC link"
  target_arns = [aws_lb.nlb.arn]
}
