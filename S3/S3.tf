provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "testbucket16341187288881634118890601"
  acl    = "private"
}