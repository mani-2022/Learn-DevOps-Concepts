output "aws_bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "aws_private_ip" {
  value = aws_instance.private.private_ip
}

output "aws_private_id" {
  value = aws_instance.private.id
}
