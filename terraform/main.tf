provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ci_server" {
  ami           = "ami-0f5ee92e2d63afc18" # Ubuntu 22.04 (Mumbai)
  instance_type = "t2.micro"

  tags = {
    Name = "ci-cd-platform"
  }
}

