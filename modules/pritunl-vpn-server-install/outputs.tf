output "ami" {
  value = data.aws_ami.ubuntu.id
}

output "pritunl_public_ip" {
  value = aws_eip.vpn_public_ip.public_ip
}

output "pritunl_private_ip" {
  value = aws_instance.pritunl.private_ip
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "pritunl_security_group" {
  value = module.security_group.security_group_id
}
