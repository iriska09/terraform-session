resource "aws_instance" "web" {
  ami           = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  key_name      = "my-pub-key"
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]
  subnet_id = aws_subnet.public[0].id

  associate_public_ip_address = true // to get a public IP
  user_data = data.template_file.user_data.rendered 
  tags = {
    Name = "terraform-session-instance"
  }

connection {
    type        = "ssh"
    user        = "ubuntu"  # Adjust based on the target instance's OS
    private_key = file("~/.ssh/id_rsa")  # Path to your private SSH key file
    host        = self.public_ip  # Assuming this is part of an AWS resource block
  }
}