provider "aws" {
   region = "us-east-1"  
   shared_config_files      = ["/root/.aws/config"]                           
   shared_credentials_files = ["/root/.aws/credentials"]
   profile = "gaurav" 
 }

terraform {
  backend "s3" {
    bucket = "terraform-dhananjay"
    key = "terraform.tfstate"          #path of file in s3 like you save file in folder so give path of folder
    region = "ap-south-1"
    dynamodb_table = "terraform-s3"    #dynamodb table name
  }
}

module "vpc" {
  source = "./vpc"
  vpc_cidr_block = var.vpc_cidr_block               #parameter = value     read values form varibales.tf
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zone = var.availability_zone
}

module "ec2" {
  source = "./ec2_instance"
  instance_count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type
  subnet_id =  module.vpc.public_subnet_id  #when we refer created resources by module for that define output block
  security_groups = [module.vpc.aws_security_group]
  key_name = var.key_name
  project = var.project
}


  
