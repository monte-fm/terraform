resource "aws_security_group" "solr_sg" {
  description = "SOLR sg"
  vpc_id      = aws_vpc.main.id
  name        = "SOLR sg"

  ingress {
    description = "Public 22 port"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Public 8983 port"
    from_port   = "8983"
    to_port     = "8983"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SOLR sg"
  }
}
