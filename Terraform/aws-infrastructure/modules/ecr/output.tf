output "aws_ecr_repo_id" {
  value = aws_ecr_repository.app.id
}

output "aws_ecr_repo_arn" {
  value = aws_ecr_repository.app.arn
}

output "aws_ecr_repo_url" {
  value = aws_ecr_repository.app.repository_url
}
