output "aws_bastion_sg_id" {
  value = aws_security_group.baiston.id
}

output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "application_sg_id" {
  value = aws_security_group.application.id
}

output "database_sg_id" {
  value = aws_security_group.database.id
}
