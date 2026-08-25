variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment for Deplopyment (eg: dev, staging, preprod, prod))"
  type        = string
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
