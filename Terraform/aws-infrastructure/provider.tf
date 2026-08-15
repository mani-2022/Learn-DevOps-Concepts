# Step 1: Declare the source and version requirements
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Step 2: Configure settings inside the provider block
provider "aws" {
  region = "us-east-1"
}
