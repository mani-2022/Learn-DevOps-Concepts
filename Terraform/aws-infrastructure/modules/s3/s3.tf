resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.project_name}-${var.environment}-app-bucket"

  tags = {
    Name        = "${var.project_name}-${var.environment}-bucket"
    Environment = var.environment
  }
}
