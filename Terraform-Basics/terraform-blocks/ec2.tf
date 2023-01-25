resource "aws_instance" "My-ec2-instance" {
 ami = "ami-0b5eea76982371e91"
 instance_type = "t2.micro"  
 user_data = file("${path.module}/httpd-install.sh")
 tags = {
    "Name" = "ec2-Vm"
 }
}