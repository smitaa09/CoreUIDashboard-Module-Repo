provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "s3-demobucket1633953846010"
  acl    = "private"
}