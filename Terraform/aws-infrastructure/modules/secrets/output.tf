output "aws_db_secret_name" {
  value = aws_secretsmanager_secret.db_credentials.name
}
output "aws_db_secret_arn" {
  value = aws_secretsmanager_secret.db_credentials.arn
}
