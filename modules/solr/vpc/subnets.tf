resource "aws_subnet" "solr_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.vpc_cidr
  tags = {
    Name = "SOLR subnet"
  }
}
