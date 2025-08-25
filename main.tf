terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
 
# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
 
}
 
# launch ec2 instance
resource "aws_instance" "myec2" {
ami = "ami-0f918f7e67a3323f0"
instance_type = "t2.micro"
 
}
