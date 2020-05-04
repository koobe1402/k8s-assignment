resource "aws_security_group" "eks_worker_sg" {
  name        = "${var.project}_instance_sg"
  description = "Security Group attached to ${var.project}_instances"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "${var.project}_instance_sg"
    Project = var.project
  }
}

