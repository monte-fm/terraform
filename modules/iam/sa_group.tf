resource "aws_iam_group" "github_sa" {
  name = "github-sa"
}

resource "aws_iam_group" "github_sa2" {
  name = "github-sa2"
}

resource "aws_iam_user_group_membership" "github_sa" {
  user = "github-service-user"

  groups = [
    aws_iam_group.github_sa.name,
    aws_iam_group.github_sa2.name,
  ]
}

resource "aws_iam_group" "terraform_sa" {
  name = "terraform-sa"
}

resource "aws_iam_group" "terraform_sa2" {
  name = "terraform-sa2"
}

resource "aws_iam_user_group_membership" "terraform_sa" {
  user = "terraform-service-user"

  groups = [
    aws_iam_group.terraform_sa.name,
    aws_iam_group.terraform_sa2.name,
  ]
}
