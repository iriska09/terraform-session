output "aws_security_group_id" {
    description = "This is security group id" 
    value = aws_security_group.web.id
}