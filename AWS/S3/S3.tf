provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "demo-bucket1642768168291"
  acl    = "private"
}