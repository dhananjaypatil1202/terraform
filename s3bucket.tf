terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"  
    shared_config_files      = ["/root/.aws/config"]                         #give path of keys       
    shared_credentials_files = ["/root/.aws/credentials"]
    profile = "gaurav" 
}

resource "aws_s3_bucket" "exampleeee3" {
    bucket = var.bucket
    object_lock_enabled = var.object_lock_enabled
    tags = var.tags
        
}

resource "aws_s3_bucket_logging" "exampleeee3" {
    bucket = aws_s3_bucket.exampleeee3.id
    target_bucket = var.target_bucket
    target_prefix = var.target_prefix
  
}

resource "aws_s3_bucket_ownership_controls" "exampleeee3" {
    bucket = aws_s3_bucket.exampleeee3.id
    rule {
      object_ownership = var.object_ownership
    }
  
}
resource "aws_s3_bucket_public_access_block" "exampleeee3" {
    bucket = aws_s3_bucket.exampleeee3.id

    block_public_acls = true
    block_public_policy = true

}

resource "aws_s3_bucket_acl" "exampleeee3" {
    
    depends_on = [ 
        aws_s3_bucket_ownership_controls.exampleeee3,
        aws_s3_bucket_public_access_block.exampleeee3,

     ]
     bucket = aws_s3_bucket.exampleeee3.id
     acl = var.acl
  
}

variable "bucket" {
    description = "Bucket name is provided"
    type = string
    default = "dhananjayasdfghj"
  
}

variable "object_lock_enabled" {
    description = "object lock is enables"
    type = bool
    default = true
  
}

variable "tags" {
    description = "tags are provided to determine purpose of bucket"
    type = map
    default = {
        Name = "Storage"
        environment = "prod"
    }
  
}

variable "target_bucket" {
    type = string
    default = "logs-buck"
  
}

variable "target_prefix" {
    type = string
    default = ""
  
}

variable "object_ownership" {
    type = string
    default = "BucketOwnerPreferred"
  
}

variable "acl" {
    type = string
    default = "public-read"
  
}

output "Bucket_Created" {
    value = "Yess"
  
}
