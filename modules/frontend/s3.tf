resource "aws_s3_bucket" "frontend" {
  bucket = "${var.environment}-frontend"
  tags = {
    Name        = "${var.environment}-frontend"
    Environment = "${var.environment}"
  }
}

resource "aws_s3_bucket_acl" "frontend" {
  bucket = aws_s3_bucket.frontend.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.bucket

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}
