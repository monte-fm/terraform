resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment}-msk-broker-logs"
  tags = {
    Name        = "${var.environment}-msk-broker-logs"
    Environment = "${var.environment}"
  }
}

resource "aws_s3_bucket_acl" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}
