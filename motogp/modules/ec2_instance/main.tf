resource "aws_instance" "demo1" {
  count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id 
  security_groups = var.security_groups
  key_name = var.key_name
  tags = {
    Name = "${var.project}-instance-${count.index}"
  }
}
