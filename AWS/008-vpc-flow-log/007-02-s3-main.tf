resource "random_id" "short_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "s3_bucket_01" {
  bucket = "${var.s3_bucket_01_name}-${random_id.short_id.hex}"

  tags = {
    Name      = "${var.s3_bucket_01_name}-${random_id.short_id.hex}"
    Terraform = "true"
  }
}

/* Bucket Versioning */
resource "aws_s3_bucket_versioning" "s3_bucket_01_versioning" {
  bucket = aws_s3_bucket.s3_bucket_01.id

  versioning_configuration {
    status = "Enabled"
  }
}

/* Bucket Encryption */
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_01_sse" {
  bucket = aws_s3_bucket.s3_bucket_01.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
