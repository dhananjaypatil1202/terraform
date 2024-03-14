terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region = var.region
  shared_config_files      = ["/home/ubuntu/.aws/config"]
  shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
  profile                  = var.profile

}

resource "aws_instance" "my_instance_2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name

  tags = var.tags
}

variable "profile" {
  default = "omi"
  type = string
  description = "here i am providing the profile for my server"
}

variable "region" {
  type = string
  description = "here i am providing region for my script"
  default = "us-east-2"
}

variable "ami" {
  type = string
  description = "here we are providing ami for my project"
  default = "ami-0f5daaa3a7fb3378b"
}

variable "instance_type" {
  type = string
  description = "here i am providing the server size"
  default = "t2.micro"
}

variable "key_name" {
  type = string
  description = "here we are providing the key-pair of my server"
  default = "windows_global_key"
}

variable "tags" {
  type = map
  description = "here i am providing the tags to my server"
  default = {
    Name = "variable-server"
    Enviorment = "production"
    Project = "XYX Project"
  }
}


output "Server_created" {
  value = "Yes created"
}


