#for multiple provider we write multiple provide blocks
provider "aws" {
  alias = "us-east-1"           #set alias for providers
  region = "us-east-1"
}

provider "aws" {
  alias = "us-west-2"            #set alias for providers      
  region = "us-west-2"
}

resource "aws_instance" "demo-1" {
    ami = ""
    instance_type = "t2.micro"
    provider = "aws.us-east-1"  
}

resource "aws_instance" "demo-2" {
    ami = ""
    instance_type = "t2.micro"
    provider = "aws.us-west-2"        #within RESOURCE block mention provider.  
}
