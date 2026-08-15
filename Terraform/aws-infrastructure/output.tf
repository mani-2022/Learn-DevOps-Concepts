output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "public-subnet_ids" {
  value = values(aws_subnet.public)[*].id
}

output "private-subnet_ids" {
  value = values(aws_subnet.private)[*].id
}
