resource "aws_security_group" "postgres_sg" {
  name        = "${var.project}_rds_sg"
  description = "Security Group attached to postgres RDS instance"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "${var.project}_rds_sg"
    Project = var.project
  }
}

resource "aws_security_group_rule" "eks_allow_postgres_db_out" {
  type                     = "egress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.postgres_sg.id

  description = "postgres RDS db exitpoint for EKS workers"

  security_group_id = var.eks_worker_sg_id
}

resource "aws_security_group_rule" "postgres_allow_eks_worker_in" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = var.eks_worker_sg_id

  description = "postgres RDS db entrypoint from EKS workers"

  security_group_id = aws_security_group.postgres_sg.id
}

