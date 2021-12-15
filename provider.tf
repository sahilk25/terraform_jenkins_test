terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}

# Configure the AWS Provider something something
provider "aws" {
  region = "ap-south-1"
}