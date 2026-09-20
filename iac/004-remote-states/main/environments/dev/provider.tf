terraform {
  backend "s3" {
    bucket = "terraform-state-for-project"
    key = "dev/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.31.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
