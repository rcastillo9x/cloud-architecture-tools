##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  profile = "terraform"
  region  = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70"
    }
  }
}

