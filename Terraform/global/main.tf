terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  backend "s3" {
    bucket         = "devops-project-tf-state"
    key            = "Terraform/global/terraform.tfstate"
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

provider "aws" {
  region = "eu-west-2"
}

# Route53 zone is shared across staging, dev and production
resource "aws_route53_zone" "route53_zone" {
  name = "zakariyahs-website.com"
}