locals {
  db_cidr_block = cidrsubnet(var.vpc_cidr, 2, 0)
}

locals {
  db_subnets = [
    for zone_no in range(3) : {
      availability_zone = data.aws_availability_zones.available.names[zone_no]
      subnet_cidr       = cidrsubnet(local.db_cidr_block, 3, zone_no)
    }
  ]
}
