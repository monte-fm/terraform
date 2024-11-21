resource "aws_eip" "vpn_public_ip" {
  instance = aws_instance.pritunl.id
  domain   = "vpc"
  tags = {
    Name        = "Pritunl VPN"
    Environment = var.environment
    Region      = var.aws_region
    AccountId   = var.account_id
  }
}
