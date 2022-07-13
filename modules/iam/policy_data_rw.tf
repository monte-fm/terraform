resource "aws_iam_group_policy_attachment" "data_rw_quickSight" {
  group      = aws_iam_group.data_rw.name
  policy_arn = "arn:aws:iam::*:policy/CustomQuickSightFullAccess"
}

resource "aws_iam_group_policy_attachment" "data_rw_lambda" {
  group      = aws_iam_group.data_rw.name
  policy_arn = aws_iam_policy.lambda_run_policy.arn
}

resource "aws_iam_group_policy_attachment" "data_rw_logs" {
  group      = aws_iam_group.data_rw.name
  policy_arn = aws_iam_policy.lambda_read_logs_policy.arn
}

resource "aws_iam_group_policy_attachment" "data_rw_glue" {
  group      = aws_iam_group.data_rw.name
  policy_arn = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"
}
