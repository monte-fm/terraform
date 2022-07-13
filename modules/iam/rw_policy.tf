data "aws_iam_policy_document" "rw_policy" {
  statement {
    sid = "Cloudwatch"
    actions = [
      "cloudwatch:*",
      "logs:*",
    ]
    resources = ["*"]
  }
  statement {
    sid       = "SimpleEmailService"
    actions   = ["ses:*"]
    resources = ["*"]
  }
  statement {
    sid       = "SystemsManager"
    actions   = ["ssm:*"]
    resources = ["*"]
  }
  statement {
    sid = "SecretsManager"
    actions = [
      "secretsmanager:*",
      "kms:*",
    ]
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
    sid       = "CloudFormation"
    actions   = ["cloudformation:*"]
    resources = ["*"]
  }
  statement {
    sid       = "Lambda"
    actions   = ["lambda:*"]
    resources = ["*"]
  }
  statement {
    sid       = "Events"
    actions   = ["events:*"]
    resources = ["*"]
  }
  statement {
    sid       = "IAM"
    actions   = ["iam:*"]
    resources = ["*"]
  }
  statement {
    sid       = "Support"
    actions   = ["support:*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "rw_policy" {
  name   = "rw-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.rw_policy.json
}
