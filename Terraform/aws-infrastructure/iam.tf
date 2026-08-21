resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-${var.environment}-ec2-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    value = "${var.project_name}-${var.environment}-ec2-role"
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-${var.environment}-ec2-profile"
  role = aws_iam_role.ec2_role.name

  tags = {
    value = "${var.project_name}-${var.environment}-ec2-profile"
  }
}

resource "aws_iam_policy" "ec2_s3_policy" {
  name = "${var.project_name}-${var.environment}-ec2-s3-policy"
  path = "/"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket" #For the least privelage we have used "S3:ListBucket" to allows listing objects inside a specific bucket. To list all the buckets use "ListAllMyBuckets"
        ]
        Effect   = "Allow"
        Resource = aws_s3_bucket.app_bucket.arn
      },

      {
        Action = [
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.app_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_s3_read" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_s3_policy.arn
}

resource "aws_iam_policy" "ec2_secrets_read" {
  name = "${var.project_name}-${var.environment}-ec2-secrets-read"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "secretsmanager:GetSecretValue"
        ]

        Resource = aws_secretsmanager_secret.db_credentials.arn
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2-secrets-read"
  }
}

resource "aws_iam_role_policy_attachment" "ec2-secret-read" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_secrets_read.arn
}
