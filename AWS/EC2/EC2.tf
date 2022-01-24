provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "from-terraform" {
  ami           = "ami-0892d3c7ee96c0bf7"
  instance_type = "t2.nano"

tags = {
    Name = "testVM"
    Env = "POC"
  }
}