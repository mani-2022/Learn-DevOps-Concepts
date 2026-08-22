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

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "aws_public_route_table_id" {
  value = aws_route_table.public-rt.id
}

output "aws_private_route_table_id" {
  value = values(aws_route_table.private-rt)[*].id
}

output "aws-nat_gateway_id" {
  value = values(aws_nat_gateway.nat-gw)[*].id
}

output "aws_eip_id" {
  value = values(aws_eip.nat-eip)[*].id
}

output "aws_bastion_sg_id" {
  value = aws_security_group.baiston.id
}
output "aws_bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "aws_bastion_private_ip" {
  value = aws_instance.bastion.private_ip
}

output "aws_private_ip" {
  value = aws_instance.private.private_ip
}

output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.address
}

output "rds_port" {
  value = aws_db_instance.postgres.port
}

output "aws_s3_bucket_name" {
  value = aws_s3_bucket.app_bucket.id
}

output "aws_db_secret_name" {
  value = aws_secretsmanager_secret.db_credentials.name
}
output "aws_db_secret_arn" {
  value = aws_secretsmanager_secret.db_credentials.arn
}

output "aws_ecr_repo_id" {
  value = aws_ecr_repository.app.id
}

output "aws_ecr_repo_url" {
  value = aws_ecr_repository.app.repository_url
}

