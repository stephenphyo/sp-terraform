resource "aws_flow_log" "vpc_01_flow_log_s3" {
  log_destination_type = "s3"
  log_destination      = aws_s3_bucket.s3_bucket_01.arn
  vpc_id               = aws_vpc.vpc_01.id
  traffic_type         = "ALL"
}
