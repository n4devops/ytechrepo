# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.30.0"
    }
  
  }
  backend "s3" {
    bucket = "ytechbucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  
 }   
}

# Provider Block
provider "aws" {
  
  region = "us-east-1"
}
