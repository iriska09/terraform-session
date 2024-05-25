variable "env" {
  type = string                 // Data type 
  description = "this variable is for envoironment"  // Description
  default = "dev"          // Default Value
}

variable "name_tag" {
  type = string                 // Data type 
  description = "this variable is for envoironment"  // Description
  default = "dev"          // Default Value
}


# Terraform Version 
# 0.0.0 - 0.11.9 = $ 

variable "ports" {
    type = list(number)
    description = " A list of port numbers"
    default = [22, 3306, 443, 80  ]
  
}

