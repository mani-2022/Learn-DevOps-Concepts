resource "aws_eks_cluster" "main" {
  name     = "${var.project_name}-${var.environment}-eks"
  role_arn = aws_iam_role.eks_cluster.arn
  version  = "1.35"

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids              = values(var.private-subnet_ids)
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]

  tags = {
    value = "${var.project_name}-${var.environment}-eks"
  }
}
