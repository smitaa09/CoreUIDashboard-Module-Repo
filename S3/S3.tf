provider "aws" {
  version = "~> 2.0"
  region  = "ap-south-1"
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "newawsbucket1601978193050"
  acl    = "public-read"
}