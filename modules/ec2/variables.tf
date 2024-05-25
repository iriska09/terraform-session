variable "env" {
  type = string
  description = "this is for enviornment"
  default = "dev"
}

variable "ami" {
  type = string
  description = "ami for ec2"
  default = "ami-0bb84b8ffd87024d8"
}

variable "instance_type" {
  type = string
  description = "instance type ec2"
  default ="t2.micro"
}

variable "sg" {
  type = list(string)
  description = "security group "
  default =[""]
}


variable "ports" {
    type = list(string)
    description = "ports"
    default = ["22", "80", "443"]
  
}