terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  backend "s3" {
    bucket         = "devops-project-tf-state"
    key            = "Terraform/production/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  environment_name = "prod"
}

resource "aws_key_pair" "zdr_key" {
  key_name          = "my_aws_key"
  public_key        = file("my_aws_key.pub")
}

module "web_app" {
  source = "../modules/ec2-webapp"
  #input variables
  instance_type     = "t2.micro"
  user_data         = file("user_data.sh")
  domain            = "zakariyahs-website.com"
  environment_name  = local.environment_name
  key_name          = "my_aws_key"
}