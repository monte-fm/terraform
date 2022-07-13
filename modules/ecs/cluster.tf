resource "aws_ecs_cluster" "ecs" {
  name = "${var.environment}-${var.cluster_name}-ecs_cluster"
  tags = {
    Name = "${var.environment}-${var.cluster_name}"
    ENV  = "${var.environment}"
  }
}

resource "aws_cloudwatch_log_group" "instance" {
  name = "${var.environment}-${var.cluster_name}-instance"
  tags = {
    Name = "${var.environment}-${var.cluster_name}"
    ENV  = "${var.environment}"
  }
}

resource "aws_launch_configuration" "instance" {
  name_prefix          = "${var.environment}-${var.cluster_name}"
  image_id             = data.aws_ami.ecs.id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.instance.name
  security_groups      = [aws_security_group.allow_all_traffic.id]
  key_name             = var.ssh_key_name
  user_data            = <<EOF
    #!/bin/bash
    # The cluster this agent should check into.
    echo 'ECS_CLUSTER=${aws_ecs_cluster.ecs.name}' >> /etc/ecs/ecs.config
  EOF
  root_block_device {
    volume_type = "standard"
    encrypted   = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = "${var.environment}-${var.cluster_name}"
  launch_configuration      = aws_launch_configuration.instance.name
  vpc_zone_identifier       = data.aws_subnets.ecs_subnet.ids
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  desired_capacity          = var.asg_min_size
  health_check_grace_period = 300
  health_check_type         = "EC2"
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "${var.environment}-${var.cluster_name}-ecs"
    propagate_at_launch = true
  }
}
