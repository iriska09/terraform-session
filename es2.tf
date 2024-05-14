

resource "aws_instance" "web" {
  ami           = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-session-instance"
  }
}
/*
Each Terraform configuration file has .tx 
// There are two main blocks 
1. Resource Block = Create and Manage Resources ( aws services or infrastructure )
- Resource Block 2 lables 
2. Data Source Block ()
*/

// Syntax:
// resource = block 
// aws_instance = first_lablel , predifunded by Terraform 
// web = second_label , (logical name or logical id ), defined by Author
// ami = argument , consists of Key/Value
    // key defined by aws 
    // value defined by users 

/* 
working direcotry = is folder where is terraform 
init is = initializes the working directory and you have first run this command 
working directory = 
is a place where you run the terraform commands
-and also terraform configuration files 
- also Root Module 
there are two module and mosulus 
terraform mosulus are littl advanced 
*/


// Terraform has Backend (terraform.tfstate)
    // Local Backend = gets generates in the same working directory 
    // Remote Backend = gets generated in the remote system such s3 bucket 

//What is the Backend 
    // 