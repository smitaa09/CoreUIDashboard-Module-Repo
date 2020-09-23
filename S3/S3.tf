provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "smita1600845260019"
  acl    = "private"
}