variable "vpc_cidr_block" {
   description = "CIDR block for the VPC"
   type = string
}

variable "public_subnet_cidr_blocks_1a" {
  description = "CIDR blocks for the public subnets 1a"
  type        = string
}

variable "public_subnet_cidr_blocks_1b" {
  description = "CIDR blocks for the public subnets 1b"
  type        = string
}

variable "private_subnet_cidr_blocks_1a" {
  description = "CIDR blocks for the private subnets 1a"
  type        = string
}

variable "private_subnet_cidr_blocks_1b" {
  description = "CIDR blocks for the private subnets 1b"
  type        = string
}

variable "availability_zone_1a" {
    description = "us_east_1a"
    type = string
}

variable "availability_zone_1b" {
    description = "us_east_1b"
    type = string
}


