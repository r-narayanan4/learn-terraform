# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet

module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  name = "${var.enviroinment}-BastionHost"
  #instance_count         = 5
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instnace_keypair
  
  vpc_security_group_ids = [module.public_bastion_sg.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0] # [0] is because we have two subnets so we [0]-public [1]-private.

  tags = local.common_tags
}