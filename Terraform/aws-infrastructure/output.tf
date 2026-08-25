output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "public-subnet_ids" {
  value = values(module.vpc.public-subnet_ids)
}

output "private-subnet_ids" {
  value = values(module.vpc.private-subnet_ids)
}

output "aws_internet_gateway_id" {
  value = module.vpc.aws_internet_gateway_id
}

output "aws_public_route_table_id" {
  value = module.vpc.public-subnet_ids
}

output "aws_private_route_table_id" {
  value = module.vpc.private-subnet_ids
}

output "aws-nat_gateway_id" {
  value = module.vpc.aws-nat_gateway_id
}

output "aws_eip_id" {
  value = module.vpc.aws_eip_id
}

output "aws_bastion_sg_id" {
  value = module.security-group.aws_bastion_sg_id
}

output "application_sg_id" {
  value = module.security-group.application_sg_id
}

output "database_sg_id" {
  value = module.security-group.database_sg_id
}

output "aws_bastion_public_ip" {
  value = module.ec2.aws_bastion_public_ip
}

output "aws_private_ip" {
  value = module.ec2.aws_private_ip
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "rds_port" {
  value = module.rds.rds_port
}

output "aws_s3_bucket_name" {
  value = module.s3.aws_s3_bucket_name
}

output "s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}

output "aws_db_secret_name" {
  value = module.secrets.aws_db_secret_name
}
output "aws_db_secret_arn" {
  value = module.secrets.aws_db_secret_arn
}

output "aws_ecr_repo_id" {
  value = module.ecr.aws_ecr_repo_id
}

output "aws_ecr_repo_url" {
  value = module.ecr.aws_ecr_repo_url
}

output "aws_ecr_repo_arn" {
  value = module.ecr.aws_ecr_repo_arn
}
