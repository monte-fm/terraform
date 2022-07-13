resource "aws_ecs_task_definition" "task" {
  depends_on            = [data.aws_ecr_image.service_name]
  family                = "${var.environment}-${var.cluster_name}"
  task_role_arn         = aws_iam_role.instance.arn
  execution_role_arn    = aws_iam_role.instance.arn
  network_mode          = "awsvpc"
  container_definitions = <<DEF
  [
    {
      "name": "${var.cluster_name}",
      "Image": "${data.aws_ecr_image.service_name.registry_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${var.docker_image_name}:${var.docker_image_tag}",
      "MemoryReservation": 512,
      "PortMappings": [{
        "ContainerPort": ${var.container_port}
      }],
      "Environment": [
        {
          "Name": "ENVIRONMENT",
          "Value": "${var.environment}"
        },
        {
          "Name": "CLUSTER_NAME",
          "Value": "${var.cluster_name}"
        },
        {
          "Name": "SPRING_PROFILE",
          "Value": "${var.app_profile_name}"
        },
        {
          "Name": "IMAGE_DIGEST",
          "Value": "${data.aws_ecr_image.service_name.id}"
        },
        {
          "Name": "DB_USER",
          "Value": "${data.aws_ssm_parameter.db_user.value}"
        },
        {
          "Name": "DB_PASS",
          "Value": "${data.aws_ssm_parameter.db_passwd.value}"
        },
        {
          "Name": "DB_RW_DOMAIN",
          "Value": "${data.aws_ssm_parameter.rds_rw_domain.value}"
        },
        {
          "Name": "DB_RO_DOMAIN",
          "Value": "${data.aws_ssm_parameter.rds_ro_domain.value}"
        }
      ],
      "LogConfiguration": {
				"LogDriver": "awslogs",
				"Options": {
					"awslogs-group": "${aws_cloudwatch_log_group.instance.name}",
					"awslogs-region": "${data.aws_region.current.name}",
					"awslogs-stream-prefix": "${var.cluster_name}"
      	}
    	}
    }
  ]
  DEF

  tags = {
    Name = "${var.environment}-${var.cluster_name}"
    ENV  = "${var.environment}"
  }
}
