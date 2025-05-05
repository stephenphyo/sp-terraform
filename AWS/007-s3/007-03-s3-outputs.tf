output "s3_bucket_01_arn" {
  description = "ARN of S3 Bucket 01"
  value       = aws_s3_bucket.s3_bucket_01.arn
}

output "s3_bucket_01_id" {
  description = "ID of S3 Bucket 01"
  value       = aws_s3_bucket.s3_bucket_01.id
}
