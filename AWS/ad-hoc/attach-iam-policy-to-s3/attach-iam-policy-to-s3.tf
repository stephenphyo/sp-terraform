data "aws_s3_bucket" "data_bucket" {
  bucket = "stephenphyo-terraform-01"
}

resource "aws_iam_policy" "policy" {
  name        = "data_bucket_policy"
  description = "Allow access to S3 bucket"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:List*",
          "s3:Get*"
        ],
        "Resource" : "${data.aws_s3_bucket.data_bucket.arn}"
      }
    ]
  })
}

output "data-bucket-arn" {
  value = data.aws_s3_bucket.data_bucket.arn
}

output "data-bucket-domain-name" {
  value = data.aws_s3_bucket.data_bucket.bucket_domain_name
}

output "data-bucket-region" {
  value = data.aws_s3_bucket.data_bucket.region
}
