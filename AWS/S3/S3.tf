provider "aws" {
  version = "~> 2.0"
  region  = "ap-east-1"
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "demobucket1643118795049"
  acl    = "private"
}