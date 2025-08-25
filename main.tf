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

variable "access_key" {
  description = "AWS access key"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}

provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

# launch ec2 instance
resource "aws_instance" "myec2" {
ami = "ami-0f918f7e67a3323f0"
instance_type = "t2.micro"
 
}
