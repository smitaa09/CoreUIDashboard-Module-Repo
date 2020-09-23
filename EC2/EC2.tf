provider "aws" {
  region = "us-west-1"
}
resource "aws_instance" "from-terraform" {
  ami           = "ami-08f3d892de259504d"
  instance_type = "t2.micro"

tags = {
    Name = "aws-EC2-Instance"
    Env = "dev"
  }
}