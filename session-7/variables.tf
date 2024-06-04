variable "region" {
  type        = string                              // Data type 
  description = "this variable is for aws regions " // Description
  default     = "us-east-1"                         // Default Value
}


variable "env" {
  type        = string                              // Data type 
  description = "this variable is for envoironment" // Description
  default     = "dev"                               // Default Value
}

variable "project" {
  type        = string                              // Data type 
  description = "this variable is for project name" // Description
  default     = "Nemo"                              // Default Value
}

variable "app" {
  type        = string                               // Data type 
  description = "this variable is for application  " // Description
  default     = "Dorry"                              // Default Value
}

variable "team" {
  type        = string                           // Data type 
  description = "this variable is for team name" // Description
  default     = "cloud"                          // Default Value
}
/////////////


variable "ec2_ports" {
  type = list(object({
    port     = number
    protocol = string
    }
  ))
  default = [
    {
      port     = 80
      protocol = "tcp"
    },
    {
      port     = 22
      protocol = "tcp"
    }
  ]
}

variable "alb_ports" {
  type = list(object({
    port     = number
    protocol = string
    }
  ))
  default = [
    {
      port     = 80
      protocol = "tcp"
    },
    {
      port     = 443
      protocol = "tcp"
    }
  ]
}

variable "instance_type" {
  type        = string
  description = "instance type "
  default     = "t2.micro"

}

variable "zone_id" {
  type        = string
  description = "instance type "
  default     = "Z04419502VOU7R26OBJKL"

}


