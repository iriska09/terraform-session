resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg
  tags = {
    Name = "${var.env}-instance", // Half dynamic , Half hard coded  
    Envoironment = var.env
  }
}
