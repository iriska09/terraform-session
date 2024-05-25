terraform {
  backend "s3" {
    bucket = "terraform-session-backend-yrys"
    key = "project/terraform.tfstate"      //Path to your Remote Backend File (terraform.tfstate)
    region = "us-west-2"
  }
}
