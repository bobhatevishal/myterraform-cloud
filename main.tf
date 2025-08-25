
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
  region     = "eu-north-1"

 

}
resource "aws_instance" "myec2" {
  ami           = var.ami_id
  instance_type = lookup(var.inst_type, terraform.workspace)
  key_name = "my-terraform-key"
  tags = {
    Name = "my-instance"
  }
}
resource "aws_security_group" "mysg" {
name = "mynewsg1"
description = "for demo"
egress {
  to_port = 0
  from_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "tls_private_key" "example_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create an AWS EC2 Key Pair using the generated public key
resource "aws_key_pair" "example_key_pair" {
  key_name   = "my-terraform-key"
  public_key = tls_private_key.example_key.public_key_openssh
}
# Save the private key to a local file
resource "local_file" "example_private_key" {
  content  = tls_private_key.example_key.private_key_pem
  filename = "my-terraform-key.pem"
  file_permission = "0400"
}
