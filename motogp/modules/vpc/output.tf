output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "aws_security_group" {
  value = aws_security_group.my-vpc-sg.id
}
