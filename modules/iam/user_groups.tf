resource "aws_iam_group" "customer_support" {
  name = "customer-support"
}

resource "aws_iam_group" "dev_ro" {
  name = "dev-ro"
}

resource "aws_iam_group" "dev_rw" {
  name = "dev-rw"
}

resource "aws_iam_group" "data_ro" {
  name = "data-ro"
}

resource "aws_iam_group" "data_rw" {
  name = "data-rw"
}
