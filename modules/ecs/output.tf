output "cluster_id" {
  value = aws_ecs_cluster.ecs.id
}

output "service_name" {
  value = aws_ecs_service.svc.name
}

output "nlb_dns_name" {
  value = aws_lb.nlb.dns_name
}
