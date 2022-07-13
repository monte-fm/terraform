resource "aws_iam_group_policy_attachment" "dev_ro_ecr" {
  group      = aws_iam_group.dev_ro.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_group_policy_attachment" "dev_ro_ec2" {
  group      = aws_iam_group.dev_ro.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "dev_ro_s3" {
  group      = aws_iam_group.dev_ro.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "dev_ro_ecs" {
  group      = aws_iam_group.dev_ro.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeDeployRoleForECS"
}

resource "aws_iam_group_policy_attachment" "dev_ro_lambda" {
  group      = aws_iam_group.dev_ro.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "dev_ro_cloudwatch" {
  group      = aws_iam_group.dev_ro.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "dev_ro_codeartifact" {
  group      = aws_iam_group.dev_ro.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeArtifactReadOnlyAccess"
}
