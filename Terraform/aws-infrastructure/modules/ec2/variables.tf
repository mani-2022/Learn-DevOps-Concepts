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

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment for Deplopyment (eg: dev, staging, preprod, prod))"
  type        = string
}

variable "private-subnet_ids" {
  description = "private subnets form the vpc module"
  type        = map(string)
}

variable "public-subnet_ids" {
  description = "public subnets form the vpc module"
  type        = map(string)
}

variable "aws_bastion_sg_id" {
  description = "bastion sg id from Security group module"
  type        = string
}

variable "application_sg_id" {
  description = "Application sg id from the Security group module"
  type        = string
}

variable "iam_instance_profile" {
  description = "iam instance profile"
  type        = string
}



