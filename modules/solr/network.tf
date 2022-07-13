resource "aws_network_interface" "network" {
  subnet_id   = module.vpc.subnet_id
  description = "SOLR subnet"
  tags = {
    Name = "SOLR network interface"
  }
  security_groups = [module.vpc.sg_id]
}
