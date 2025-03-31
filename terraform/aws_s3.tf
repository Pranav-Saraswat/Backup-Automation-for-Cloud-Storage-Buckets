resource "aws_s3_bucket" "backup" {
  bucket = var.aws_s3_bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }
}

variable "aws_region" {}
variable "aws_s3_bucket_name" {}

output "aws_s3_bucket_url" {
  value = aws_s3_bucket.backup.bucket
}
