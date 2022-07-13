resource "aws_subnet" "db_subnets" {
  count             = length(local.db_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(local.db_subnets, count.index).subnet_cidr
  availability_zone = element(local.db_subnets, count.index).availability_zone
  tags = merge(
    {
      Name = "Db subnet for ${var.environment}-${var.stack}"
      ENV  = "${var.environment}-${var.stack}"
    }
  )
}
