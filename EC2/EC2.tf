provider "aws" {
  region = "regionValue"
}
resource "aws_instance" "from-terraform" {
  ami           = "ami-08f3d892de259504d"
  instance_type = "t2.microValue"

tags = {
    Name = "aws-EC2-InstanceValue"
    Env = "envValue"
  }
}