terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = var.bucket_key
    region         = var.aws_region
    dynamodb_table = var.dynamodb_lock
    encrypt        = var.encrypt
  }
}