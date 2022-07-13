resource "aws_iam_group_policy_attachment" "dev_rw_ecr" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_group_policy_attachment" "dev_rw_ec2" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "dev_rw_s3" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "dev_rw_ecs" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_group_policy_attachment" "dev_rw_lambda" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}

resource "aws_iam_group_policy_attachment" "dev_rw_cloudwatch" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

resource "aws_iam_group_policy_attachment" "dev_rw_rds" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_group_policy_attachment" "dev_rw_codeartifact" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeArtifactAdminAccess"
}

resource "aws_iam_group_policy_attachment" "dev_rw_glueconsole" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"
}

resource "aws_iam_group_policy_attachment" "dev_rw_policy" {
  group      = aws_iam_group.dev_rw.name
  policy_arn = aws_iam_policy.rw_policy.arn
}
