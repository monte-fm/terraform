/*
 * Public route tables
 */

resource "aws_route_table" "public_route_table_a" {
  depends_on = [aws_subnet.public_subnet_a]
  vpc_id     = aws_vpc.main.id
  tags = merge(
    {
      Name = "${var.environment} - public route table A"
      ENV  = "${var.environment}"
      Type = "Public"
    }
  )
}

resource "aws_route_table" "public_route_table_b" {
  depends_on = [aws_subnet.public_subnet_b]
  vpc_id     = aws_vpc.main.id
  tags = merge(
    {
      Name = "${var.environment} - public route table B"
      ENV  = "${var.environment}"
      Type = "Public"
    }
  )
}

resource "aws_route_table" "public_route_table_c" {
  depends_on = [aws_subnet.public_subnet_c]
  vpc_id     = aws_vpc.main.id
  tags = merge(
    {
      Name = "${var.environment} - public route table C"
      ENV  = "${var.environment}"
      Type = "Public"
    }
  )
}

/*
 * Public route tables association
 */

resource "aws_route_table_association" "public_subnet_association_a" {
  depends_on     = [aws_subnet.public_subnet_a]
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route_table_a.id
}

resource "aws_route_table_association" "public_subnet_association_b" {
  depends_on     = [aws_subnet.public_subnet_b]
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_route_table_b.id
}

resource "aws_route_table_association" "public_subnet_association_c" {
  depends_on     = [aws_subnet.public_subnet_c]
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public_route_table_c.id
}

/*
 * Public routes
 */

resource "aws_route" "public_route_a" {
  depends_on             = [aws_subnet.public_subnet_a]
  route_table_id         = aws_route_table.public_route_table_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "public_route_b" {
  depends_on             = [aws_subnet.public_subnet_b]
  route_table_id         = aws_route_table.public_route_table_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "public_route_c" {
  depends_on             = [aws_subnet.public_subnet_c]
  route_table_id         = aws_route_table.public_route_table_c.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

/*
 * Private route tables
 */
resource "aws_route_table" "private_route_table_a" {
  depends_on = [aws_subnet.private_subnet_a]
  vpc_id     = aws_vpc.main.id
  tags = merge(
    {
      Name = "${var.environment} - private route table A"
      ENV  = "${var.environment}"
      Type = "Private"
    }
  )
}

resource "aws_route_table" "private_route_table_b" {
  depends_on = [aws_subnet.private_subnet_b]
  vpc_id     = aws_vpc.main.id
  tags = merge(
    {
      Name = "${var.environment} - private route table B"
      ENV  = "${var.environment}"
      Type = "Private"
    }
  )
}

resource "aws_route_table" "private_route_table_c" {
  depends_on = [aws_subnet.private_subnet_c]
  vpc_id     = aws_vpc.main.id
  tags = merge(
    {
      Name = "${var.environment} - private route table C"
      ENV  = "${var.environment}"
      Type = "Private"
    }
  )
}

/*
 * Private route table association
 */

resource "aws_route_table_association" "private_subnet_association_a" {
  depends_on     = [aws_subnet.private_subnet_a]
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_route_table_a.id
}

resource "aws_route_table_association" "private_subnet_association_b" {
  depends_on     = [aws_subnet.private_subnet_b]
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_route_table_b.id
}

resource "aws_route_table_association" "private_subnet_association_c" {
  depends_on     = [aws_subnet.private_subnet_c]
  subnet_id      = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.private_route_table_c.id
}

/*
 * Private routes
 */

resource "aws_route" "private_route_a" {
  depends_on             = [aws_subnet.private_subnet_a]
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway_a.id
  route_table_id         = aws_route_table.private_route_table_a.id
}

resource "aws_route" "private_route_b" {
  depends_on             = [aws_subnet.private_subnet_b]
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway_b.id
  route_table_id         = aws_route_table.private_route_table_b.id
}

resource "aws_route" "private_route_c" {
  depends_on             = [aws_subnet.private_subnet_c]
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway_c.id
  route_table_id         = aws_route_table.private_route_table_c.id
}
