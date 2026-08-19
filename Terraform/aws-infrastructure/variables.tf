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

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the AWS EC2 key pair"
  type        = string
  default     = "Docker-keys"

}

variable "db_name" {
  description = "Name of the Database"
  type        = string
}

variable "db_username" {
  description = "Username of the Database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Password of the Database"
  type        = string
  sensitive   = true
}
