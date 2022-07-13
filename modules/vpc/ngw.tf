resource "aws_nat_gateway" "nat_gateway_a" {
  allocation_id = aws_eip.public_ip_a.id
  subnet_id     = aws_subnet.public_subnet_a.id
  tags = merge(
    {
      Name = "${var.environment} - Nat Gateway A"
      ENV  = "${var.environment}"
    }
  )
}

resource "aws_nat_gateway" "nat_gateway_b" {
  allocation_id = aws_eip.public_ip_b.id
  subnet_id     = aws_subnet.public_subnet_b.id
  tags = merge(
    {
      Name = "${var.environment} - Nat Gateway B"
      ENV  = "${var.environment}"
    }
  )
}

resource "aws_nat_gateway" "nat_gateway_c" {
  allocation_id = aws_eip.public_ip_c.id
  subnet_id     = aws_subnet.public_subnet_c.id
  tags = merge(
    {
      Name = "${var.environment} - Nat Gateway C"
      ENV  = "${var.environment}"
    }
  )
}
