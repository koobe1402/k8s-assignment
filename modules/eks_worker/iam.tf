resource "aws_iam_role" "eks_worker_instance_role" {
  name = "${var.project}_eks_worker_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name    = "${var.project}_eks_worker_instance_role"
    Project = var.project
  }
}

resource "aws_iam_instance_profile" "eks_worker_instance_profile" {
  name = "${var.project}_eks_worker_instance_profile"
  role = aws_iam_role.eks_worker_instance_role.name
}

resource "aws_iam_role_policy_attachment" "eks_worker_policy_attachement" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_worker_instance_role.name
}

resource "aws_iam_role_policy_attachment" "eks_worker_ECR_policy_attachement" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_worker_instance_role.name
}

resource "aws_iam_role_policy_attachment" "eks_worker_cni_attachement" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_worker_instance_role.name
}

