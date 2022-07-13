resource "aws_ecr_repository" "ecr" {
  name = var.repo_name

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Name = "ECR repo for ${var.repo_name}"
  }
}
