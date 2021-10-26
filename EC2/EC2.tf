provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "from-terraform" {
  ami           = "ami-0416f96ae3d1a3f29"
  instance_type = "t2.micro"

tags = {
    Name = "TestInstance"
    Env = "poc"
  }
}