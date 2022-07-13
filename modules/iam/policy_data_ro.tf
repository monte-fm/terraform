resource "aws_iam_group_policy_attachment" "data_ro_quickSight" {
  group      = aws_iam_group.data_ro.name
  policy_arn = "arn:aws:iam::710158161422:policy/Quick-Sight-ReadOnly-Policy"
}

resource "aws_iam_group_policy_attachment" "data_ro_lambda" {
  group      = aws_iam_group.data_ro.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "data_ro_logs" {
  group      = aws_iam_group.data_ro.name
  policy_arn = aws_iam_policy.lambda_read_logs_policy.arn
}

resource "aws_iam_group_policy_attachment" "data_ro_glue" {
  group      = aws_iam_group.data_ro.name
  policy_arn = aws_iam_policy.glue_ro.arn
}

resource "aws_iam_policy" "glue_ro" {
  name        = "ReadAccessGlue"
  path        = "/"
  description = "Read access into AWS GLUE"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ReadAccessGlue",
      "Effect": "Allow",
      "Action": [
        "glue:BatchGet*",
        "glue:CheckSchemaVersionValidity",
        "glue:Get*",
        "glue:List*",
        "glue:QuerySchemaVersionMetadata",
        "glue:SearchTables"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
