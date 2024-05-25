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
  default     = "jerry"                             // Default Value
}

variable "tier" {
  type        = string                                   // Data type 
  description = "this variable is for application tier " // Description
  default     = "backend"                                // Default Value
}

variable "team" {
  type        = string                           // Data type 
  description = "this variable is for team name" // Description
  default     = "cloud"                          // Default Value
}

variable "owner" {
  type        = string                           // Data type 
  description = "this variable is for owner of " // Description
  default     = "yrys"                           // Default Value
}

variable "managed_by" {
  type        = string                               // Data type 
  description = "this variable is for who managed  " // Description
  default     = "yrys"                               // Default Value
}