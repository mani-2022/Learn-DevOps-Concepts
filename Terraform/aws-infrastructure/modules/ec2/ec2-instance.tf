resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.public-subnet_ids["us-east-1a"]
  vpc_security_group_ids      = [var.aws_bastion_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-${var.environment}-instance"
  }
}

resource "aws_instance" "private" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.private-subnet_ids["us-east-1a"]
  vpc_security_group_ids      = [var.application_sg_id]
  iam_instance_profile        = var.iam_instance_profile
  key_name                    = var.key_name
  associate_public_ip_address = false

  tags = {
    Name = "${var.project_name}-${var.environment}-private-instance"
  }
}
