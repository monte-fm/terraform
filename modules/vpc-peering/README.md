# Terraform AWS VPC peering configuration

Contains configuration for peering between VPCs. 
We need this because we create a new vpc for pretty much every new stack we deploy. 
Make sure you don't duplicate cidrs that attach to the remote vpc. 
It's a good idea to check the aws dashboard


## Usage

```
module "vpc_peering" {
  source             = "./modules/vpc-peering"
  accepter_vpc_name  = var.accepter_vpc
  requester_vpc_name = var.requester_vpc
  environment        = var.environment
  resource_tags      = var.resource_tags
}
```
