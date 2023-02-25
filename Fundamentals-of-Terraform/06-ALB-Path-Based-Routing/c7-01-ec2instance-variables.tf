# AWS EC2 Instance Terraform Variables
# EC2 Instance Variables

# AWS EC2 Instance Type
variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t3.micro"
}

# AWS EC2 instance key pair
variable "instance_keypair" {
    description = "AWS EC2 key pair that need to be associated with ec2 instance"
    type = string
    default = "Terraform-key"
}

# AWS EC2 Private Instance Count
variable "private_instance_count" {
  description = "AWS EC2 Private Instances Count"
  type = number
  default = 1  
}

