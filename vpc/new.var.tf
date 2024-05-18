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

# variable "public_subnet_id" {
#   description = "Public subnet list for assoiciation "
#   type        = list(string)
#   default     = aws_subnet.public.id
# }
