provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "from-terraform" {
  ami           = "ami-0aad84f764a2bd39a"
  instance_type = "t2.micro"

tags = {
    Name = "TestInstance01"
    Env = "POC"
  }
}
