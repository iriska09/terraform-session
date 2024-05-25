resource "aws_launch_template" "main" {
  name_prefix   = "asg-template"
  image_id      = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 3
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.main.id

  }
}