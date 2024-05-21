
resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2023.image_id #we have to reference image id 
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data = data.template_file.user_data.rendered // get an output of the file it is like cat command and redirection command 
#   user_data = <<EOF
#   #!/bin/bash
#   yum install httpd -y 
#   systemctl start httpd 
#   systemctl enable httpd
#   echo "hello from the instance" > /var/www/html/index.html
# EOF


  tags = {
    Name = "${var.env}-instance", // Half dynamic , Half hard coded
    Name1 = format("%s-instance",var.env)  
    Envoironment = var.env
  }
}

// Syntax :
// How to referrence to Input Variable 
// var.variable_name