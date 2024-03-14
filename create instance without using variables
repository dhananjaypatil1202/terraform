terraform{
    required_providers {  
      aws = {                            #connect aws with terraform  
        source = "hashicorp/aws"         #collect all AWS files/plugins related to aws from harshicorp registry & that executable files are responsible to create infra through terraform.
        version = "5.40.0"
      }
    }
}                                        # after an terr. init it will install all plugins of AWS version 5.40

provider "aws" {                             #provider block with help of block terraform will login to aws 
  region = "us-east-1"
  shared_config_files      = ["/root/.aws/config"]                         #give path of keys       
  shared_credentials_files = ["/root/.aws/credentials"]
  profile = "gaurav" 
}

resource "aws_instance" "myterraform" {
    ami = "ami-0fe630eb857a6ec83"                  #ami of instance
    instance_type = "t2.micro"                      
    key_name = "virginia"
    tags = {
      Name = "dhananjay"                           #name of instance
      Enviornment = "staging"
      Project = "xyz"
    }
  
}
