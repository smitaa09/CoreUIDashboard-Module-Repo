provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "from-terraform" {
  ami           = "ami-0231217be14a6f3ba"
  instance_type = "t2.micro"

tags = {
    Name = "TestInstance01"
    Env = "POC"
  }
}