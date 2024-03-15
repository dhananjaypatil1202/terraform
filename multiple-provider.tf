#different configuration for different providers
provider "aws" {                             #provider block with help of block terraform will login to aws 
   region = "us-east-1"
   shared_config_files      = ["/root/.aws/config"]                         #give path of keys       
   shared_credentials_files = ["/root/.aws/credentials"]
   profile = "gaurav" 
 }

provider "azurerm" {
    subscription_id = ""
    client_id = ""
    client_secret = "" 
    tenant_id = ""                             # life profile in aws
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

resource "azure_virtual_machines" "example" {
    name = "example-vm"
    location = "eastus"
    size = "Standard-A1"
 }

     
