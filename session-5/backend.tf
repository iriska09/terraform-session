terraform {
  backend "s3" {
    bucket = "terraform-session-backend-yrys"
    key    = "session-3/terraform.tfstate" //Path to your Remote Backend File (terraform.tfstate)
    region = "us-west-2"
  }
}
// for the team work the remout 