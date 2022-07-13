resource "aws_ecs_service" "svc" {
  name                               = "${var.environment}-${var.cluster_name}"
  cluster                            = aws_ecs_cluster.ecs.id
  task_definition                    = aws_ecs_task_definition.task.arn
  desired_count                      = var.asg_min_size
  scheduling_strategy                = var.isDaemon ? "DAEMON" : "REPLICA"
  force_new_deployment               = true
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_target.arn
    container_name   = var.cluster_name
    container_port   = var.container_port
  }

  network_configuration {
    subnets         = data.aws_subnets.ecs_subnet.ids
    security_groups = [aws_security_group.allow_all_traffic.id]
  }
}
