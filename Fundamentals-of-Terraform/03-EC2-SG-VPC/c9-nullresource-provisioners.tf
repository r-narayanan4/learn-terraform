# create a Null resource and provisioners

resource "null_resource" "name" {
    depends_on = [module.ec2_public]
    # connetion block for provisioners to connect to ec2 instance
    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = aws_eip.BastionHost.public_ip 
    private_key = file("privatekey/Terraform-key.pem")
  }
}

## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem

provisioner "file" {
  source      = "private-key/Terraform-key.pem"
  destination = "/tmp/Terraform-key.pem"
}

## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host

provisioner "remote-exec" {
    inline = [
        "sudo chmod 400 /tmp/Terraform-key.pem"
    ]     
}

## Local Exec Provisioner:  local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)

provisioner "local-exec" {
    command = "echo VPC created on 'date' and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
    
}

## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
/*  provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    #on_failure = continue
  }  
*/

# Creation Time Provisioners - By default they are created during resource creations (terraform apply)
# Destory Time Provisioners - Will be executed during "terraform destroy" command (when = destroy)