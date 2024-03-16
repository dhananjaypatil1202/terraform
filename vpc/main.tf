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

#data "aws_security_group" "all_traffic" {
#  name = "default"
#}

resource "aws_vpc" "three-tier" {
   cidr_block = var.vpc_cidr_block          
   tags = {
     Name = "3-tier-deployment"
  }
}

resource "aws_internet_gateway" "three-tier-igw" {                   #gatway
vpc_id = aws_vpc.three-tier.id                                       #dynamic variable value
tags = {
    Name = "3-tier-igw"
    }
} 

resource "aws_route_table" "route-table" {                          #route table vpc
  vpc_id = aws_vpc.three-tier.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.three-tier-igw.id
  }
  tags = {
    Name = "3-tier-route-table"
  }
}

resource "aws_subnet" "public_subnet_for_az-1a" {                    #public subnet 1a
    vpc_id = aws_vpc.three-tier.id
    cidr_block = var.public_subnet_cidr_blocks_1a
    availability_zone = var.availability_zone_1a
    map_public_ip_on_launch = true
    tags = {
    Name = "public-subnet-az-1a"                                    
  }
}

resource "aws_subnet" "public_subnet_for_az-1b" {                    #public subnet 1b
    vpc_id = aws_vpc.three-tier.id
    cidr_block = var.public_subnet_cidr_blocks_1b
    availability_zone = var.availability_zone_1b
    map_public_ip_on_launch = true
      tags = {
    Name = "public-subnet-az-1b"                    
  }
}

resource "aws_subnet" "private_subnet_for_az-1a" {                    #pvt subnet 1a
    vpc_id = aws_vpc.three-tier.id
    cidr_block = var.private_subnet_cidr_blocks_1a
    availability_zone = var.availability_zone_1a
      tags = {
    Name = "pvt-subnet-az-1a"                    
  }
}

resource "aws_subnet" "private_subnet_for_az-1b" {                     #pvt subnet 1b
    vpc_id = aws_vpc.three-tier.id
    cidr_block = var.private_subnet_cidr_blocks_1b
    availability_zone = var.availability_zone_1b
    tags = {
    Name = "pvt-subnet-az-1b"                                  
  }
}

resource "aws_route_table" "demo-pvt-rt" {                            #pvt route table
  vpc_id = aws_vpc.three-tier.id
  tags = {
    Name = "pvt-rt-table"
  }
}

resource "aws_route_table_association" "public-subnet-association-1a" {
  subnet_id = aws_subnet.public_subnet_for_az-1a.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route_table_association" "public-subnet-association-1b" {
  subnet_id = aws_subnet.public_subnet_for_az-1b.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route_table_association" "pvt_subnet_association-1a" {
  subnet_id = aws_subnet.private_subnet_for_az-1a.id
  route_table_id = aws_route_table.demo-pvt-rt.id
  }

resource "aws_route_table_association" "pvt_subnet_association-1b" {
  subnet_id = aws_subnet.private_subnet_for_az-1b.id 
  route_table_id = aws_route_table.demo-pvt-rt.id
  }
