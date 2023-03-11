#Input Variables
#AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"  
}

# AWS EC2 Instance Type
variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}

# AWS EC2 instance key pair
variable "instance_keypair" {
    description = "AWS EC2 key pair that need to be associated with ec2 instance"
    type = string
    default = "Terraform-key"
}