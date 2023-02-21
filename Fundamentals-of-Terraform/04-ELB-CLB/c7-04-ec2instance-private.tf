# AWS EC2 Instance Terraform Module
# Private-instance - EC2 Instance that will be created in VPC Private Subnet

module "ec2_private" {
  depends_on = [module.vpc] 
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  name = "${var.environment}-private-vm"
  #instance_count         = 5
  instance_count         = var.private_instance_count
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [module.private_sg.this_security_group_id]
  subnet_ids           = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]
  ]
  user_data = file("${path.module}/app1-install.sh")
  
  tags = local.common_tags
}

/**
 depends_on is used because we need internet for private instance  to install or run app1-install.sh
 So we need to wait untill to create NAT gateway/vpc resource to install the app.
 **/
 