terraform {
  required_version = "~> 0.14.10"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "us-west-1"
  profile = "default"
}
