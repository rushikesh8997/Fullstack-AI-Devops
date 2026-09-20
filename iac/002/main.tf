# -------------------------------
# Terraform block
# -------------------------------
# This block tells Terraform:
# 1. Which providers are required
# 2. Where to download them from
# 3. Which version to use

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.31.0"
    }
  }
}


# -------------------------------
# Provider configuration
# -------------------------------
# This tells Terraform:
# - Which cloud to talk to (AWS)
# - Which region to create resources in

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

# -------------------------------
# Resource block (EC2 instance)
# -------------------------------
# This block defines an AWS EC2 instance

resource "aws_instance" "demo_ec2" {
    ami = "ami-0ff5003538b60d5ec"
    # instance_type = "t3.micro"
    instance_type = var.instance_type
    monitoring = var.enable_monitoring

    tags = {
        Name = var.instance_name
    }
}

resource "aws_iam_user" "demo_user" {
  name = "terraform-demo-user"

  tags = {
    Purpose = "terraform-demo"
  }
}


resource "aws_s3_bucket" "demo_bucket" {
  bucket = "terraform-demo-bucket-24527652358"

  tags = {
    Purpose     = "terraform-demo"
    Environment = "demo"
  }
}

resource "aws_s3_bucket_versioning" "demo_bucket_versioning" {
  bucket = aws_s3_bucket.demo_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}