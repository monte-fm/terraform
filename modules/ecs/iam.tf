data "aws_iam_policy_document" "instance_policy" {
  statement {
    sid       = "CloudwatchPutMetricData"
    actions   = ["cloudwatch:PutMetricData"]
    resources = ["*"]
  }
  statement {
    sid       = "SimpleEmailServiceAccess"
    actions   = ["ses:*"]
    resources = ["*"]
  }
  statement {
    sid       = "SystemsManagerAccess"
    actions   = ["ssm:*"]
    resources = ["*"]
  }
  statement {
    sid       = "S3AdminAccess"
    actions   = ["s3:*"]
    resources = ["*"]
  }
  statement {
    sid       = "CognitoUserPools"
    actions   = ["cognito-idp:*"]
    resources = ["*"]
  }
  statement {
    sid       = "CognitoIdentity"
    actions   = ["cognito-identity:*"]
    resources = ["*"]
  }
  statement {
    sid = "InstanceLogging"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
    ]
    resources = [aws_cloudwatch_log_group.instance.arn]
  }
  statement {
    sid       = "SecretsManager"
    actions   = ["secretsmanager:*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "instance_policy" {
  name   = "${var.environment}-${var.cluster_name}-instance_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.instance_policy.json
}

resource "aws_iam_role" "instance" {
  name = "${var.environment}-${var.cluster_name}-instance"
  tags = {
    Name = "${var.environment}-${var.cluster_name}"
    ENV  = "${var.environment}"
  }

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    },
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      }
    },
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "application-autoscaling.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_policy" {
  role       = aws_iam_role.instance.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "instance_policy" {
  role       = aws_iam_role.instance.name
  policy_arn = aws_iam_policy.instance_policy.arn
}

resource "aws_iam_instance_profile" "instance" {
  name = "${var.environment}-${var.cluster_name}-instance-profile"
  role = aws_iam_role.instance.name
}
