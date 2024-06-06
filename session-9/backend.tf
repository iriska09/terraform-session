terraform {
  backend "s3" {
    bucket = "terraform-session-backend-yrys"
    key    = "session9/terraform.tfstate" //Path to your Remote Backend File (terraform.tfstate)
    region = "us-west-2"
    dynamodb_table = "terraform-lock-file"
    encrypt = true
  }
}
