locals {
  cf_origin_id = "${var.environment}-frontend"
}

resource "aws_cloudfront_distribution" "frontend" {
  depends_on          = [aws_s3_bucket_website_configuration.frontend]
  aliases             = ["${var.domain}"]
  comment             = "${var.environment}-frontend"
  enabled             = true
  default_root_object = "index.html"
  price_class         = "PriceClass_100"

  lifecycle {
    ignore_changes = [web_acl_id, ]
  }

  origin {
    origin_id   = local.cf_origin_id
    domain_name = aws_s3_bucket_website_configuration.frontend.website_endpoint
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.cf_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 60
    max_ttl                = 600
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  tags = {
    Environment = "${var.environment}"
    Name        = "${var.environment}-frontend"
    Domain      = "${var.domain}"
  }
}
