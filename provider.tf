terraform {
  

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = "~>0.13.0"
}

provider "aws" {
  # Configuration options
    region = var.region
}
