provider "aws" {
  version = "~> 2.0"
  region  = "us-west-1"
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "awss3bucket1598006821030"
  acl    = "public-read"
}


