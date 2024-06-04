locals {
  name = "aws-${var.team}-${var.project}-rtype-${var.app}-${var.env}"
  common_tags = {
    Environment = var.env
    Team        = var.team
    Application = var.app
    Project     = var.project
    Owner       = "yrys"
    Managed_By  = "Terraform"
  }
  asg_tags = merge(
    { Name = replace(local.name, "rtype", "asg") },
    local.common_tags
  )
}

