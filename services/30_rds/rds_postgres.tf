module "subnet_group" {
  source = "../../modules/rds_subnet_group/"

  project  = var.project

  private_subnets_ids = data.terraform_remote_state.network.outputs.private_subnets_ids
}

module "postgres" {
  source = "../../modules/rds_postgres/"

  project  = var.project

  db_identifier = "${var.project}-rds"

  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type

  engine                      = var.engine
  engine_version              = var.engine_version
  apply_immediately           = var.apply_immediately
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window

  instance_class      = var.instance_class
  deletion_protection = var.deletion_protection
  port                = var.port
  publicly_accessible = var.publicly_accessible

  username             = var.username
  password             = random_password.postgres_password.result

  db_subnet_group_name = module.subnet_group.subnet_group_id
  vpc_id               = data.terraform_remote_state.network.outputs.vpc_id
  eks_worker_sg_id     = data.terraform_remote_state.eks_worker.outputs.eks_worker_sg_id
}

