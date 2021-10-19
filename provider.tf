terraform {
  required_version = "~>0.13.0" #can be any version in 0.13.x

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1" # AWS region to create resources
}
