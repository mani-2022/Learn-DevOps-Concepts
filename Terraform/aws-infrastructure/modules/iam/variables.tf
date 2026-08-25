variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment for Deplopyment (eg: dev, staging, preprod, prod))"
  type        = string
}

variable "s3_bucket_arn" {
  description = "AWS s3 bucket arn"
  type        = string
}

variable "aws_db_secret_arn" {
  description = "AWS db secrets arn"
  type        = string
}

variable "aws_ecr_repo_arn" {
  description = "AWS ecr repo arn"
}
