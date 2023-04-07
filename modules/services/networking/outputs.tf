output "vpc-id-out" {
  value = aws_vpc.main.id
}
output "vpc-public-subnet-id-out" {
  value = aws_subnet.public_subnet[0].id
}

output "vpc-all-public-subnet-id-out" {
  value = aws_subnet.public_subnet.*.id
}

output "vpc-private-subnet-id-out" {
  value = aws_subnet.private_subnet.*.id
}