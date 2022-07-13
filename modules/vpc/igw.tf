resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    {
      Name = "${var.environment} - igw"
      ENV  = "${var.environment}"
    }
  )
}