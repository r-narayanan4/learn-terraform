# Terraform Settings Block
Terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        #version = "~> 3.21" # Optional but recommended in production
      }
    }
}

# Provider Block
provider "aws" {
    profile = "default" # AWS Credentials profile configured on your local desktop terminal $HOME/.aws.credentials
    region = "us-east-1"
}

# Resource Block
resource "aws_instance" "ec2-demo" {
    ami           = "ami-0b5eea76982371e91" # Amazon Linux in  us-east-1, update as per your region
    instance_type = "t2.micro"
}