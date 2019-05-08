/**
 * Postgres RDS Subnets.
 */
resource "aws_subnet" "postgres_rds_subnet_a" {
  vpc_id = "${data.aws_vpc.cluster.id}"
  cidr_block = "${var.cluster_subnet_cidr_database_a}"
  map_public_ip_on_launch = false
  availability_zone = "${var.region}a"

  tags {
    Name = "${var.env_name}.${var.base_domain}-postgres-rds-subnet-a"
  }
}

resource "aws_route_table_association" "route_of_postgres_rds_subnet_a" {
  subnet_id = "${aws_subnet.postgres_rds_subnet_a.id}"
  route_table_id = "${aws_route_table.private_route_table_a.id}"
}

resource "aws_subnet" "postgres_rds_subnet_b" {
  vpc_id = "${data.aws_vpc.cluster.id}"
  cidr_block = "${var.cluster_subnet_cidr_database_b}"
  map_public_ip_on_launch = false
  availability_zone = "${var.region}b"

  tags {
    Name = "${var.env_name}.${var.base_domain}-postgres-rds-subnet-b"
  }
}

resource "aws_route_table_association" "route_of_postgres_rds_subnet_b" {
  subnet_id = "${aws_subnet.postgres_rds_subnet_b.id}"
  route_table_id = "${aws_route_table.private_route_table_b.id}"
}

resource "aws_subnet" "postgres_rds_subnet_c" {
  vpc_id = "${data.aws_vpc.cluster.id}"
  cidr_block = "${var.cluster_subnet_cidr_database_c}"
  map_public_ip_on_launch = false
  availability_zone = "${var.region}c"

  tags {
    Name = "${var.env_name}.${var.base_domain}-postgres-rds-subnet-c"
  }
}

resource "aws_route_table_association" "route_of_postgres_rds_subnet_c" {
  subnet_id = "${aws_subnet.postgres_rds_subnet_c.id}"
  route_table_id = "${aws_route_table.private_route_table_c.id}"
}

resource "aws_route_table" "private_route_table_a" {
  vpc_id = "${data.aws_vpc.cluster.id}"

  tags {
    Name = "${var.env_name}.${var.base_domain}-private_route_table_a"
  }
}

resource "aws_route_table" "private_route_table_b" {
  vpc_id = "${data.aws_vpc.cluster.id}"

  tags {
    Name = "${var.env_name}.${var.base_domain}-private_route_table_b"
  }
}

resource "aws_route_table" "private_route_table_c" {
  vpc_id = "${data.aws_vpc.cluster.id}"

  tags {
    Name = "${var.env_name}.${var.base_domain}-private_route_table_c"
  }
}