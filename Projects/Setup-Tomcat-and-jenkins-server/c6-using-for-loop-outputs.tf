
/*
# EC2 Instance Public IP and Name and DNS
output "instance_public_ip_and_name_and_Public_dns" {
  description = "Public IP address, Public DNS and name of EC2 instances"
  value = {
    for instance in aws_instance.*:
      instance.id => {
        public_ip = instance.public_ip,
        public_dns = instance.public_dns,
        name      = instance.tags.Name
      } 
  }
}
*/