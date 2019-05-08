/**
 * AWS Domain zone.
 */
data "aws_route53_zone" "base_zone" {
  name = "${var.base_domain}"
}

/**
 * Postgres records of route53.
 */
resource "aws_route53_record" "postgres_rds" {
  count = "${var.count ? 1 : 0}"
  zone_id = "${data.aws_route53_zone.base_zone.zone_id}"
  name = "${var.dns_rds_identifier}.${var.env_name}.${var.base_domain}"
  type = "CNAME"
  ttl = "300"
  records = [
    "${aws_db_instance.postgres_rds_instance.address}"]
}

resource "aws_route53_record" "postgres_rds_replica" {
  count = "${var.rds_replica_enabled ? 1 : 0}"
  zone_id = "${data.aws_route53_zone.base_zone.zone_id}"
  name = "${var.dns_rds_identifier}-replica.${var.env_name}.${var.base_domain}"
  type = "CNAME"
  ttl = "300"
  records = [
    "${aws_db_instance.replica_of_postgres_rds_instance.address}"]
}
