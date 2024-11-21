module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name               = var.cluster_name
  cidr               = var.cidr
  azs                = var.azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Environment = var.environment
    Region      = var.aws_region
    AccountId   = var.account_id
  }
}
