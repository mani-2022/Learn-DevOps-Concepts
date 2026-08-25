variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment for Deplopyment (eg: dev, staging, preprod, prod))"
  type        = string
}

variable "alb_sg_id" {
  description = "alg sg id from the Security group module"
  type        = string
}

variable "public-subnet_ids" {
  description = "public subnets form the vpc module"
  type        = map(string)
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "aws_private_id" {
  description = "AWS private instance id"
  type        = string
}
