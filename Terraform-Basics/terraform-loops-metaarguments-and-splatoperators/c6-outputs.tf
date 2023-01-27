# Terraform Output Values

# Output - For Loop with List
output "for_output_list" {
    description = "For Loop with List"
    value = [for instance in  aws_instance.my_ec2: instance.public_dns]
}
# Output - For Loop with map

output "for_output_map1" {
    description = "For Loop with Map1"
    value = {for instance in  aws_instance.my_ec2: instance.id => instance.public_dns}
}
# output - For Loop with Map Advanced
output "for_output_map2" {
    description = "For Loop with Map Advanced"
    value = {for c, instance in  aws_instance.my_ec2: c => instance.public_dns}
}

/*
# output - Legacy Splat operator(latest) -Returns the list
output "legacy_splat_instance_publicdns" {
    description = "Legacy Splat operator"
    value = aws_instance.my_ec2.*.public_dns
}
*/ #We are going to comment the legacy splat operator, which might be decommissioned in future versions

# output Latest Generalized Splat Operator -Returns the List
output "latest_splat_instance_publicdns" {
    description =  "Generalized latest Splat operator"
    value = aws_instance.my_ec2[*].public_dns
}
