# Pritunl Installation guide

https://aws.plainenglish.io/self-hosted-pritunl-vpn-in-aws-fc9c204c7cbd

## WEB

1) Open ssh/https port for your public ip over security group manually

2) Generate key

`sudo pritunl setup-key`

3) Login into the webpage and use the key to install pritunl

4) Get pritunl credentials

`sudo pritunl default-password`

4) Use public IP of Pritunl for the organisation/server/users creation.

# Pritunl client

1) Download from here
https://client.pritunl.com/

2) Add profile from the file

3) Connect with pin-code

!!!If you have error with DNS you should enable 2
options on your pritunl client side:

- Disable DNS
- Force DNS configuration

# Terragrunt usage of this module:

```yaml

terraform {
  source = "./modules/pritunl-vpn-server-install"
}

dependency "ssh_key_pair" {
  config_path = "../ssh-key-pair-vpn"
}

include "root" {
  path = find_in_parent_folders()
}

locals {
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  parsed       = regex(".*/aws/(?P<account>.*?)/(?P<region>.*?)/(?P<env>.*?)/.*", get_terragrunt_dir())
  common_vars  = read_terragrunt_config(find_in_parent_folders("common.hcl"))

  account_id                  = local.account_vars.locals.account_id
  account_name                = local.parsed.account
  aws_region                  = local.parsed.region
  cidr                        = local.env_vars.locals.vpn_cidr
  environment                 = local.parsed.env
  azs                         = local.env_vars.locals.azs
  private_subnets             = local.env_vars.locals.vpn_private_subnets
  public_subnets              = local.env_vars.locals.vpn_public_subnets
  cluster_name                = "${local.parsed.env}-${local.parsed.region}-vpn"
  ec2_instance_type           = local.env_vars.locals.vpn_ec2_instance_type
  tf_state_bucket_name        = local.env_vars.locals.tf_state_bucket_name
  dynamodb_tf_state_lock_name = local.env_vars.locals.dynamodb_tf_state_lock_name
}

inputs = {
  cluster_name      = local.cluster_name
  cidr              = local.cidr
  azs               = local.azs
  private_subnets   = local.private_subnets
  public_subnets    = local.public_subnets
  aws_region        = local.aws_region
  account_id        = local.account_id
  environment       = local.environment
  ec2_instance_type = local.ec2_instance_type
  ec2_ssh_key_name  = dependency.ssh_key_pair.outputs.ssh_key_pair_name

  tf_state_bucket_name               = local.tf_state_bucket_name
  dynamodb_terraform_state_lock_name = local.dynamodb_tf_state_lock_name

  tags = merge(
    local.common_vars.inputs.tags,
    {
      Environment = "${local.environment}"
      Region      = "${local.aws_region}"
      AccountId   = "${local.account_id}"
    }
  )
}

```