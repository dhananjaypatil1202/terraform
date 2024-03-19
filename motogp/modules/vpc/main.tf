resource "aws_vpc" "my-vpc" {
   cidr_block = var.vpc_cidr_block          
   tags = {
     Name = "my-vpc"
  }
}

resource "aws_internet_gateway" "myvpc-igw" {                   #gatway
vpc_id = aws_vpc.my-vpc.id                                       #dynamic variable value
tags = {
    Name = "myvpc-igw"
    }
} 

resource "aws_route_table" "route-table" {                          #route table vpc
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myvpc-igw.id
  }
  tags = {
    Name = "my-vpc-route-table"
  }
}

resource "aws_subnet" "public_subnet" {                    #public subnet 1a
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.public_subnet_cidr_blocks
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
    tags = {
    Name = "public-subnet-az-1a"                                    
  }
}

resource "aws_subnet" "private_subnet" {                    #pvt subnet 1a
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.private_subnet_cidr_blocks
    availability_zone = var.availability_zone
      tags = {
    Name = "pvt-subnet-az-1a"                    
  }
}

resource "aws_route_table" "pvt-rt" {                            #pvt route table
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "pvt-rt-table"
  }
}

resource "aws_route_table_association" "public-subnet-association-1a" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route_table_association" "pvt_subnet_association-1a" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.pvt-rt.id
  }

resource "aws_security_group" "my-vpc-sg" {
  name = "my-vpc-sg"
  vpc_id = aws_vpc.my-vpc.id
  
  
dynamic "ingress" {                                          # block will created/repeat for each port
    for_each = [80, 443, 3306, 22, 8080, 9100, 9090]
      iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  
}
