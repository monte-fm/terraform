resource "aws_iam_policy" "s3_bucket_read" {
  name        = "ReadAccessIntoS3"
  path        = "/"
  description = "Read access into S3"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3Read",
      "Effect": "Allow",
      "Action": [
        "s3:GetLifecycleConfiguration",
        "s3:GetBucketTagging",
        "s3:GetInventoryConfiguration",
        "s3:GetAccessPointPolicyForObjectLambda",
        "s3:GetObjectVersionTagging",
        "s3:GetBucketLogging",
        "s3:GetAccelerateConfiguration",
        "s3:GetBucketPolicy",
        "s3:GetStorageLensConfigurationTagging",
        "s3:GetObjectVersionTorrent",
        "s3:GetObjectAcl",
        "s3:GetEncryptionConfiguration",
        "s3:GetBucketObjectLockConfiguration",
        "s3:GetIntelligentTieringConfiguration",
        "s3:GetBucketRequestPayment",
        "s3:GetAccessPointPolicyStatus",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectTagging",
        "s3:GetMetricsConfiguration",
        "s3:GetBucketOwnershipControls",
        "s3:GetBucketPublicAccessBlock",
        "s3:GetBucketPolicyStatus",
        "s3:GetObjectRetention",
        "s3:GetBucketWebsite",
        "s3:GetJobTagging",
        "s3:GetAccessPointPolicyStatusForObjectLambda",
        "s3:GetBucketVersioning",
        "s3:GetBucketAcl",
        "s3:GetObjectLegalHold",
        "s3:GetAccessPointConfigurationForObjectLambda",
        "s3:GetBucketNotification",
        "s3:GetReplicationConfiguration",
        "s3:GetObject",
        "s3:GetStorageLensConfiguration",
        "s3:GetObjectTorrent",
        "s3:DescribeJob",
        "s3:GetBucketCORS",
        "s3:GetAnalyticsConfiguration",
        "s3:GetObjectVersionForReplication",
        "s3:GetBucketLocation",
        "s3:GetAccessPointPolicy",
        "s3:GetAccessPointForObjectLambda",
        "s3:GetObjectVersion",
        "s3:GetStorageLensDashboard"
      ],
      "Resource": "*"
    },
    {
      "Sid": "S3List",
      "Effect": "Allow",
      "Action": [
        "s3:ListAccessPointsForObjectLambda",
        "s3:GetAccessPoint",
        "s3:GetAccountPublicAccessBlock",
        "s3:ListAccessPoints",
        "s3:ListAllMyBuckets",
        "s3:ListBucket"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_run_policy" {
  name        = "RunLambdaPolicy"
  path        = "/"
  description = "Run Lambda policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "RunLambdaPolicy",
      "Effect": "Allow",
      "Action": [
        "lambda:InvokeFunction",
        "lambda:GetLayerVersion",
        "lambda:GetEventSourceMapping",
        "lambda:GetFunction",
        "lambda:GetFunctionConfiguration",
        "lambda:GetLayerVersionPolicy",
        "lambda:GetFunctionCodeSigningConfig",
        "lambda:GetProvisionedConcurrencyConfig",
        "lambda:GetFunctionConcurrency",
        "lambda:ListTags",
        "lambda:GetFunctionEventInvokeConfig",
        "lambda:GetCodeSigningConfig",
        "lambda:GetAlias",
        "lambda:GetPolicy"
      ],
      "Resource": "*"
    },
    {
      "Sid": "ListLambdas",
      "Effect": "Allow",
      "Action": [
        "lambda:GetAccountSettings",
        "lambda:ListFunctions"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_read_logs_policy" {
  name        = "ReadLambdaLogs"
  path        = "/"
  description = "Read Lambda logs policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ReadLambdaLogs",
      "Effect": "Allow",
      "Action": [
        "logs:GetLogRecord",
        "logs:GetQueryResults",
        "logs:StartQuery",
        "logs:GetLogEvents",
        "logs:StopQuery",
        "logs:TestMetricFilter",
        "logs:FilterLogEvents",
        "logs:GetLogGroupFields",
        "logs:GetLogDelivery",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_group_policy_attachment" "customer_support_s3" {
  group      = aws_iam_group.customer_support.name
  policy_arn = aws_iam_policy.s3_bucket_read.arn
}

resource "aws_iam_group_policy_attachment" "customer_support_lambda_run" {
  group      = aws_iam_group.customer_support.name
  policy_arn = aws_iam_policy.lambda_run_policy.arn
}

resource "aws_iam_group_policy_attachment" "customer_support_lambda_read_logs" {
  group      = aws_iam_group.customer_support.name
  policy_arn = aws_iam_policy.lambda_read_logs_policy.arn
}
