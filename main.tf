# allows terraform to connect to AWS
provider "aws" {
  region = "us-east-2"
  profile = "Terraform-User"
}

# stores the terraform state file in S3
terraform {
  backend "s3" {
    bucket = "frank-terraform"
    key = "terraform.tfstate.dev"
    region = "us-east-2"
    profile = "Terraform-User"
    
  }
}