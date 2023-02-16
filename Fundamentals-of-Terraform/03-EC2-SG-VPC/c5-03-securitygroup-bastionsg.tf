# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host

module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws//examples/complete"
  version = "4.17.1"

  name = "public-bastion-sg"
  description = "SG with SSH port open for everyboy (IPv4 CIDR), egress ports are all world open"
  vpc_id = module.vpc.vpc_id

  #Ingress Rules & CIDR Blocks

  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  
  # Egress Rule -all-all open

  egress_rules = ["all-all"]
  tags = local.common_tags
}

