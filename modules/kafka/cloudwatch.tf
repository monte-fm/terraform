resource "aws_cloudwatch_log_group" "kafka" {
  name = "${var.environment}-msk_broker_logs"
}
