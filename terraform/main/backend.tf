terraform {
  backend "s3" {
    bucket = "gopin-aws-management"
    key    = "Terraform/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-locking"
  }
}