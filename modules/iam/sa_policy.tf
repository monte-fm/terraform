#NOTE: you can assign only 10 policies per group
resource "aws_iam_group_policy_attachment" "github_iam" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_group_policy_attachment" "github_s3" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "github_cloudwatch" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

resource "aws_iam_group_policy_attachment" "github_ses" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
}

resource "aws_iam_group_policy_attachment" "github_cloudwatch_events" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"
}

resource "aws_iam_group_policy_attachment" "github_cloudformation" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"
}

resource "aws_iam_group_policy_attachment" "github_lambda" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}

resource "aws_iam_group_policy_attachment" "github_code_artifact" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeArtifactAdminAccess"
}

resource "aws_iam_group_policy_attachment" "github_api_gateway" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}

resource "aws_iam_group_policy_attachment" "github_secrets_manager" {
  group      = aws_iam_group.github_sa.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

#NOTE: you can assign only 10 policies per group
resource "aws_iam_group_policy_attachment" "github_ecr" {
  group      = aws_iam_group.github_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_group_policy_attachment" "github_ssm" {
  group      = aws_iam_group.github_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_group_policy_attachment" "github_vpc" {
  group      = aws_iam_group.github_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_group_policy_attachment" "github_ec2" {
  group      = aws_iam_group.github_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "github_kms" {
  group      = aws_iam_group.github_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AWSKeyManagementServicePowerUser"
}

resource "aws_iam_group_policy_attachment" "github_ecs" {
  group      = aws_iam_group.github_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_group_policy_attachment" "github_rds" {
  group      = aws_iam_group.github_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_group_policy_attachment" "github_cloudfront" {
  group      = aws_iam_group.github_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
}

#NOTE: you can assign only 10 policies per group

resource "aws_iam_group_policy_attachment" "terraform_kms" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AWSKeyManagementServicePowerUser"
}

resource "aws_iam_group_policy_attachment" "terraform_ec2" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_iam" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_s3" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_cloudwatch" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_ecs" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_ssm" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_vpc" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_msk" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonMSKFullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_kinesis_firehouse" {
  group      = aws_iam_group.terraform_sa.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonKinesisFirehoseFullAccess"
}

#NOTE: you can assign only 10 policies per group

resource "aws_iam_group_policy_attachment" "terraform_api_gateway" {
  group      = aws_iam_group.terraform_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}

resource "aws_iam_group_policy_attachment" "terraform_ecr" {
  group      = aws_iam_group.terraform_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_rds" {
  group      = aws_iam_group.terraform_sa2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}
