// Naming Cinventions : Naming Standard = is for team work and standard name for the team every single resource has to have naming standard 

# 1. Provider name: aws,aws,azure,google
# 2. Region :use1,usw1,usw2
# 3. Envoirnment :dev,qa,stage,Provider
# 4. Project Name : batman,tom,jerry
# 5. Application Tier : frontend ,backend , db
# 6. Resource Type : ec2,s3,alb,sg,rds

# Example : Provider_name-region-env-project_name-application_tier-resouce_type
# RDS Instance 
# aws-usw1-dev-batman-frontend-ec2

// Tagging Standard : Common Tags 

# 1. Envoirnment :dev,qa,stage,Provider
# 2. Project Name : batman,tom,jerry
# 3. Application Tier : frontend ,backend , db
# 4.Team : cloud,devops,development
# 5.Owner : Kris
# 6. Managed_by = cloudformation ,terraform , python ,manual 

locals {
  name = "aws-${var.region}-${var.env}-${var.project}-${var.tier}-rtype"
  common_tags = {
    Environment = var.env
    Project     = var.project
    Tier        = var.tier
    Team        = var.team
    Owner       = var.owner
    Managed_By  = var.managed_by
  }
}