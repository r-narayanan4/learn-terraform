# Tomcat-server-instance 
# EC2 Instance

resource "aws_instance" "Tomcat-Server" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    user_data = file("${path.module}/setup-tomcat-server.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [aws_security_group.Tomcat-server-sg.id]
    tags = {
        "Name" = "Tomcat-Server"
    } 
}
