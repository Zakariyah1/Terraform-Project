terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "EC2" {
  source = "../vpc"
}



resource "aws_instance" "EC2-WebApp" {
  ami                    = var.ami_id 
  instance_type          = var.instance_type
  subnet_id              = module.EC2.public_subnet_id
  security_groups        = [module.EC2.aws_security_group_id]
  user_data              = file("user_data.sh")
  key_name               = var.key_name
}
