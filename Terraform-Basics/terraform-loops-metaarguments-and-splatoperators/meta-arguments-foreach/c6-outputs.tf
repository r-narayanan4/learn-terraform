# EC2 instance Public IP with TOSET

output "instance_publicip" {
    description = "EC2 instance Public IP"
    #value = aws_instance.my_ec2.*.public_ip # Legacy Splat
    #value = aws_instance.my_ec2[*].public_ip # Latest Splat
    value = toset([for instance in aws_instance.my_ec2 : instance.public_ip])
}

output "instance_publicdns" {
    description = "EC2 instance Public DNS"
    #value = aws_instance.my_ec2.*.public_dns #Lagacy splat
    #value = aws_instance.my_ec2[*].public_dns # Latest Splat
    value = toset([for instance in aws_instance.my_ec2 : instance.public_dns])
}

# Ec2 instance Public DNS with TOMAP
output "instance_publicdns2" {
    description = "EC2 instance Public DNS using tomap"
    value = tomap({
        for s, my_ec2 in aws_instance.my_ec2 : s => my_ec2.public_dns
        # s intends to be a subnet ID
    })
}