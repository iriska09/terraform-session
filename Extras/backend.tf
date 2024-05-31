terraform {
  backend "s3" {
    bucket = "terraform-session-jan-backend"
    key    = "extras/terraform.tfstate"
    region = "us-west-2"
  }
}