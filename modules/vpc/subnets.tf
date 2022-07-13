resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 3, 0)
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = merge(
    {
      Name = "Public subnet for ${var.environment}"
      ENV  = "${var.environment}"
      Type = "Public"
    }
  )
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 3, 1)
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags = merge(
    {
      Name = "Public subnet for ${var.environment}"
      ENV  = "${var.environment}"
      Type = "Public"
    }
  )
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 3, 2)
  availability_zone       = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true
  tags = merge(
    {
      Name = "Public subnet for ${var.environment}"
      ENV  = "${var.environment}"
      Type = "Public"
    }
  )
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 3, 4)
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = merge(
    {
      Name = "Private subnet for ${var.environment}"
      ENV  = "${var.environment}"
      Type = "Private"
    }
  )
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 3, 5)
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = merge(
    {
      Name = "Private subnet for ${var.environment}"
      ENV  = "${var.environment}"
      Type = "Private"
    }
  )
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 3, 6)
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = merge(
    {
      Name = "Private subnet for ${var.environment}"
      ENV  = "${var.environment}"
      Type = "Private"
    }
  )
}
