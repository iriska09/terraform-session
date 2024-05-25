module "ec2"{
   ####### Module Argument ######
   source = "../../modules/ec2/" // required Aargument ,where you specify the location of child module 
  // version = "value" //Optional Argument ,where specify the version of your child module
  ### Input Variables that are required for the Child module ####
  env = "dev"
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  sg = [module.sg.aws_security_group_id]
}

module "sg"{
   ####### Module Argument ######
   source = "../../modules/sg" // required Aargument ,where you specify the location of child module 
  // version = "value" //Optional Argument ,where specify the version of your child module
  ### Input Variables that are required for the Child module ####
  env = "dev"
  ports = [ "23"]
  
}