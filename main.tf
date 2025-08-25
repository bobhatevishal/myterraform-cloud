terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
 
# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
access_key = var.access_key
secret_key = var.secret_key
}
resource "aws_instance" "myinstance" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  count = 2
  tags = {
    Name = "myinstance ${count.index+1}"
}
}
