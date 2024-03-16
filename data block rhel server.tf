provider "aws" {                             #provider block with help of block terraform will login to aws 
   region = "us-east-1"
   shared_config_files      = ["/root/.aws/config"]                         #give path of keys       
   shared_credentials_files = ["/root/.aws/credentials"]
   profile = "gaurav" 
 }

 data "aws_security_group" "my_sg" {      #here we mention existing SG which ae outside the Terraform conf file
    name = "default"                   # you also give id of sg      
 }

 variable "ami" {
    type = string
    default = "ami-0fe630eb857a6ec83" 
 }
 
 variable "instance_type" {
    type = string
    default = "t2.micro"
 }

 variable "key_name" {
    type = string
    default = "virginia"
 }
 
 resource "aws_instance" "demo-1" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [data.aws_security_group.my_sg.id]   # we call this sg using data block
    
    tags = {
        Name = "dhananjay"
    }
 } 

  output "public_ip" {
    value = aws_instance.demo-1.public_ip
  }
