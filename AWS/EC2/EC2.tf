provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "from-terraform" {
  ami           = "ami-07dc734dc14746eab"
  instance_type = "t2.micro"

tags = {
    Name = "TestInstance01"
    Env = "POC"
  }
}
