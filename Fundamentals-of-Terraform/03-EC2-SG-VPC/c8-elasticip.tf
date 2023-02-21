# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument

resource "aws_eip" "BastionHost" {
    depends_on = [module.ec2_public, module.vpc]
    instance = module.ec2_public.id
    vpc      = true
    tags     = local.common_tags  
}
