# EC2 Instance

resource "aws_instance" "my_ec2" {
    ami = data.aws_ami.amzlinux2.id
    #instance_type = var.intstance_type
    instance_type = var.intstance_type_list[1] # for List
    #instance_type = var.instance_type_map{"qa"} # for Map
    user_data = file("${path.module}/httpd-install.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [aws_security_group.My-vpc.id, aws_security_group.My-web.id]
    count = 2
    tags = {
        "Name" = "EC2-demo-${count.index}"
    } 
}

