output "vpc_id" {
  value = aws_vpc.main.id
}

output "sg_id" {
  value = aws_security_group.solr_sg.id
}

output "subnet_id" {
  value = aws_subnet.solr_subnet.id
}
