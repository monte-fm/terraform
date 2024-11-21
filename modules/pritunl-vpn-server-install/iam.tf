data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "pritunl_policy" {
  statement {
    actions = [
      "ec2:DescribeRouteTables",
      "ec2:CreateRoute",
      "ec2:ReplaceRoute",
      "ec2:DeleteRoute"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_instance_profile" "pritunl_instance_profile" {
  name_prefix = "pritunl_instance_profile"
  role        = aws_iam_role.pritunl_role.name

  tags = {
    Environment = var.environment
    Region      = var.aws_region
    AccountId   = var.account_id
  }
}

resource "aws_iam_role" "pritunl_role" {
  name_prefix        = "pritunl_role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json

  inline_policy {
    name   = "pritunl-policy"
    policy = data.aws_iam_policy_document.pritunl_policy.json
  }

  tags = {
    Environment = var.environment
    Region      = var.aws_region
    AccountId   = var.account_id
  }
}
