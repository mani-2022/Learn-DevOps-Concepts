resource "aws_db_subnet_group" "database" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = [for subnet in aws_subnet.private : subnet.id]


  tags = {
    Name = "${var.project_name}-${var.environment}-database"
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = "${var.project_name}-${var.environment}-postgres"
  allocated_storage       = 20
  max_allocated_storage   = 30
  engine                  = "postgres"
  engine_version          = "17"
  instance_class          = "db.t3.micro"
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  vpc_security_group_ids  = [aws_security_group.database.id]
  db_subnet_group_name    = aws_db_subnet_group.database.name
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 7


  tags = {
    Name = "${var.project_name}-${var.environment}-postgres"
  }
}
