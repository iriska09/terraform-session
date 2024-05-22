variable "cidr_blocks_public" {
  description = "List of cidr blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "cidr_blocks_private" {
  description = "List of cidr blocks for subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}




variable "availability_zones" {
  description = "List of cidr blocks for subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

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

variable "instance_type" {
    type = string
    description = " A list of port numbers"
    default = "t2.micro"

}