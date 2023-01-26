# EC2 Instance

resource "aws_instance" "my-ec2" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.intstance_type
    user_data = file("${path.module}/httpd-install.sh")
    Key_name = var.instance_keypair
    vpc_security_group_ids = [aws_security_group.My-vpc.id, aws_security_group.My-web.id]
    tags = {
        "Name" = "EC2 demo"
    } 
}

