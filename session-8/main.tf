resource "aws_security_group" "main" {
  name        = "main"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // all ports, protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "main" {
  key_name   = "pub-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  depends_on             = [null_resource.main]
  ami                    = "ami-09e647bf7a368e505"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = aws_key_pair.main.key_name // Corrected key_name reference

  provisioner "file" {
    source      = "/Users/fatimabolotbekkyzy/Desktop/terraform-jan-sess/terraform-session/session-8/index.html"
    destination = "/tmp/index.html"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("~/.ssh/id_rsa")
    }
  }
}

resource "null_resource" "main" {
  provisioner "local-exec" { // Corrected typo in provisioner type
    command = "echo 'Testing local exec, file, remote-exec provisioners' > index.html"
  }
}
