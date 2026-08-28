variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment for Deplopyment (eg: dev, staging, preprod, prod))"
  type        = string
}

variable "private-subnet_ids" {
  description = "public subnets form the vpc module"
  type        = map(string)
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "node_instance_type" {
  type        = string
  description = "EC2 instance type for EKS worker nodes"
}

variable "node_desired_size" {
  type        = number
  description = "Desired number of EKS worker nodes"
}

variable "node_min_size" {
  type        = number
  description = "Minimum number of EKS worker nodes"
}

variable "node_max_size" {
  type        = number
  description = "Maximum number of EKS worker nodes"
}

variable "node_disk_size" {
  type        = number
  description = "Disk size in GiB for EKS worker nodes"
}
