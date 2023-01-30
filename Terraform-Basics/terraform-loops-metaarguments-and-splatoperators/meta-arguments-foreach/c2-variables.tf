#Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

# AWS EC2 Instance Type
variable "intstance_type" {
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

#AWS EC2 instance Type -List
variable "intstance_type_list" {
  description = "EC2 Instance Type"
  type = list(string)
  default = [ "t2.micro","t2.small", "t3.small"]
}

#AWS EC2 Instance Type - MAP
variable "intstance_type_map" {
  description = "EC2 instance Type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t2.small"
    "prod" = "t3.micro"
  }
  
}