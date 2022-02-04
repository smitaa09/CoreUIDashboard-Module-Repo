provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "from-terraform" {
  ami           = "ami-043656646caf929b9"
  instance_type = "t2.micro"

tags = {
    Name = "TestInstance01"
    Env = "POC"
  }
}