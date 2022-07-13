resource "aws_s3_bucket" "name" {
  bucket = var.bucket_name
  tags = {
    Name = "${var.bucket_name}"
  }
}

resource "aws_s3_bucket_acl" "name" {
  bucket = aws_s3_bucket.name.id
  acl    = var.bucket_access_acl
}
