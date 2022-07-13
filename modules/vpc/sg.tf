resource "aws_security_group" "public" {
  description = "${var.environment} public group "
  vpc_id      = aws_vpc.main.id
  name        = "${var.environment}-public-security-group"

  ingress {
    description = "Public 80 port"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Public 443 port"
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment} public sg"
    ENV  = "${var.environment}"
  }
}

resource "aws_security_group" "public_ssh" {
  description = "${var.environment} public ssh group "
  vpc_id      = aws_vpc.main.id
  name        = "${var.environment}-public-ssh-security-group"

  ingress {
    description = "Public 22 port"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Public 8983 port"
    from_port   = "8983"
    to_port     = "8983"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment} public-ssh sg"
    ENV  = "${var.environment}"
  }
}

resource "aws_security_group" "private" {
  description = "${var.environment} private security group "
  vpc_id      = aws_vpc.main.id
  name        = "${var.environment}-private-security-group"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment} private sg"
    ENV  = "${var.environment}"
  }
}
