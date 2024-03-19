variable "instance_count" {}

variable "ami" {}

variable "instance_type" {}

variable "subnet_id" {}

variable "key_name" {}

variable "security_groups" {
    type = set(string)
}

variable "project" {}

