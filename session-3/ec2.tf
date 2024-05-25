resource "aws_instance" "web" {
  count = length( var.ports )
  ami           = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  tags = {
    Name = "${var.env}-instance", // Half dynamic , Half hard coded  
    Envoironment = "var.env"
  }
}

# // Syntax :
# // How to referrence to Input Variable 
# // var.variable_name
