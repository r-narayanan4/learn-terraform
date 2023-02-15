#Terraform Block
terraform {
  required_version = "~> 1.3.7" #This ~> symbol allows 1.3.8, 1.3.9 but not deny 1.4.0 # if we write ~> 1.3 it allows 1.3.xx, 1.4.xx, 1.5.xx but deny 1.0  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
     }
  }                              
} 
# Provider Block
provider "aws" {
    region = var.aws_region
}

/*
Note-1: AWS Credentials Profile (profile = "default") configured on your local desktop terminal
$HOME/.aws/credentials
*/