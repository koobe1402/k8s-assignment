resource "aws_eks_cluster" "eks_cluster" {
  name = "${var.project}_cluster"

  version = var.eks_version

  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids              = var.subnet_ids
    public_access_cidrs     = var.public_access_cidrs
    endpoint_private_access = true
    endpoint_public_access  = true
  }


  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy_attachement,
    aws_iam_role_policy_attachment.eks_service_policy_attachement,
  ]

  tags = {
    Name    = "${var.project}_cluster"
    Project = var.project
  }

}

