provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "from-terraform" {
  ami           = "ami-0f18e475ccdc50e07"
  instance_type = "t2.micro"

tags = {
    Name = "testVM01"
    Env = "poc"
  }
}