resource "aws_db_instance" "wordpress_db" {
  identifier            = "wordpress-db"
  allocated_storage     = 100 
  storage_type          = "io2"
  iops                  = 1000  
  engine                = "mysql"
  engine_version        = "8.0.35"
  instance_class        = "db.t3.micro"
  username              = "admin"
  password              = "password"
  publicly_accessible   = false
  tags = {
    "Name" = "wordpress_db"
  }
    // Skip the final snapshot when destroying the instance
  skip_final_snapshot = true
}
