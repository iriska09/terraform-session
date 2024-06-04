# output "aws_security_group_id" {
#     description = "This is security group id" 
#     value = aws_security_group.web.id
# }


# //child

# resource "aws_instance" "example" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
# }

# output "instance_id" {
#   value = aws_instance.example.id
# }

# ///root
# provider "aws" {
#   region = "us-west-2"
# }

# resource "aws_instance" "example" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
# }

# output "instance_id" {
#   value = aws_instance.example.id
# }
# //combo
# provider "aws" {
#   region = "us-west-2"
# }

# module "ec2_instance" {
#   source        = "./modules/ec2_instance"
#   ami_id        = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
# }

# output "instance_id" {
#   value = module.ec2_instance.instance_id
# }
