resource "aws_eip" "public_ip_a" {
  vpc = true
  tags = merge(
    {
      Name = "${var.environment} - EIP-A"
      ENV  = "${var.environment}"
    }
  )
}

resource "aws_eip" "public_ip_b" {
  vpc = true
  tags = merge(
    {
      Name = "${var.environment} - EIP-B"
      ENV  = "${var.environment}"
    }
  )
}

resource "aws_eip" "public_ip_c" {
  vpc = true
  tags = merge(
    {
      Name = "${var.environment} - EIP-C"
      ENV  = "${var.environment}"
    }
  )
}
