resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 2, 0)
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = merge(
    {
      Name = "Public subnet_a for ${var.environment}"
      ENV  = "${var.environment}"
      Type = "Public"
    }
  )
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 2, 1)
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags = merge(
    {
      Name = "Public subnet_b for ${var.environment}"
      ENV  = "${var.environment}"
      Type = "Public"
    }
  )
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 2, 2)
  availability_zone       = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true
  tags = merge(
    {
      Name = "Public subnet_c for ${var.environment}"
      ENV  = "${var.environment}"
      Type = "Public"
    }
  )
}
