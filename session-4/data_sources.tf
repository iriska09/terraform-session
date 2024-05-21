data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.*"]  
  }


  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


data "template_file" "user_data" {
    template = file("user_data.sh")
    vars = {
        envoironment = var.env
    }
}



// Data Sources Block : Fetch the data from Pre-existing Resource
// Syntax : data "first_label" "second_label"