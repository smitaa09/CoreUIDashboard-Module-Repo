provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "testingmcp1655121589547"
  acl    = "private"
}