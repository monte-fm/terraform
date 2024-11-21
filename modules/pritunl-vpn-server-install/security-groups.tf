module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"
  name    = var.cluster_name
  vpc_id  = module.vpc.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH access"
      cidr_blocks = var.cidr
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "HTTPS access"
      cidr_blocks = var.cidr
    },
    {
      from_port   = 18512
      to_port     = 18512
      protocol    = "udp"
      description = "VPN client access"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = {
    Environment = var.environment
    Region      = var.aws_region
    AccountId   = var.account_id
  }
}
