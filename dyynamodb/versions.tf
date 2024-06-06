terraform {
  required_version = "~> 1.8.3" // Terafform Version 
  required_providers {          // Provider Version
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
}