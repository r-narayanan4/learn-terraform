#Data source
data "aws_ec2_instance_type_offerings" "my_inst_type1" {
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    #values = ["us-east-1a"]
    values = ["us-east-1e"]
  }

  location_type = "availability-zone"
}

#output

output "output_v1_1" {
    value = data.aws_ec2_instance_type_offerings.my_inst_type1.instance_types
}
 #This code is to check whether the t3.micro instance  type is avilable or not in a specific AZ