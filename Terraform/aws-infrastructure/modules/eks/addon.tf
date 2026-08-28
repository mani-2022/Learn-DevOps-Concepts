resource "aws_eks_addon" "pod_identity_agent" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "eks-pod-identity-agent"

  tags = {
    Name = "${var.project_name}-${var.environment}-pod-identity-agent"
  }
}
