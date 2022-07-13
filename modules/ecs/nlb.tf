resource "aws_lb" "nlb" {
  name                       = "${var.environment}-${var.cluster_name}-nlb"
  internal                   = true
  load_balancer_type         = "network"
  subnets                    = data.aws_subnets.nlb_subnet.ids
  enable_deletion_protection = false
  ip_address_type            = "ipv4"
  tags = {
    Name = "${var.environment}-${var.cluster_name}"
    ENV  = "${var.environment}"
  }
}

resource "aws_lb_target_group" "ecs_target" {
  depends_on  = [aws_lb.nlb]
  name        = "${var.environment}-${var.cluster_name}"
  target_type = "ip"
  port        = var.container_port
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.environment}-${var.cluster_name}"
    ENV  = "${var.environment}"
  }
}

resource "aws_lb_listener" "http_listener" {
  depends_on = [
    aws_lb.nlb,
    aws_lb_target_group.ecs_target,
  ]
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_target.arn
  }
}
