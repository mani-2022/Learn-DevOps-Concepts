variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "environment" {
  description = "Environment for Deplopyment (eg: dev, staging, preprod, prod))"
  type        = string
}

variable "subnet_netbits" {
  description = "Number of bits for subnet mask"
  type        = number
  default     = 8
}

variable "az_count" {
  description = "Number of availability zones to use"
  type        = number
  default     = 3
}
