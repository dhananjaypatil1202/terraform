variable "instance_count" {
  default = "2"
}

variable "ami" {
  default = "ami-080e1f13689e07408"
}

variable "key_name" {
  default = "virginia"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "project" {
  default = "project"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_blocks" {
  default = "10.0.2.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}

