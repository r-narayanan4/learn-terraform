# Terraform Output Values

# EC2 Instance name-1
output "instance_name1" {
  description = "Name of the EC2 instance"
  value = aws_instance.Tomcat-Server.tags.Name
}

# EC2 Instance Public IP-1
output "instance_public_ip1" {
    description = "EC2 instance public ip"
    value = aws_instance.Tomcat-Server.public_ip
}

# EC2 Instance Public DNS-1
output "instance_public_dns1" {
    description = "EC2 instance public dns"
    value = aws_instance.Tomcat-Server.public_dns
}

# EC2 Instance name-2
output "instance_name2" {
  description = "Name of the EC2 instance"
  value = aws_instance.Jenkins-Server.tags.Name
}


# EC2 Instance Public IP-2
output "instance_public_ip2" {
    description = "EC2 instance public ip"
    value = aws_instance.Jenkins-Server.public_ip
}

# EC2 Instance Public DNS-2
output "instance_public_dns2" {
    description = "EC2 instance public dns"
    value = aws_instance.Jenkins-Server.public_dns
}
