provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "testing1633964930286"
  acl    = "private"
}