terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  subnet_id      = aws_subnet.MY_SUBNET.id
}

resource "aws_subnet" "MY_SUBNET" {
  vpc_id     = aws_vpc.FirstVPC1.id
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "MY_SUBNET"
  }
}
  resource "aws_vpc" "FirstVPC1" {
  cidr_block = "172.31.0.0/16"

   tags = {
    Name = "FirstVPC1"
  }
}

