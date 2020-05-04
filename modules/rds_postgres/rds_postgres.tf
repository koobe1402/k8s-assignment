resource "aws_db_instance" "postgres" {
  identifier           = var.db_identifier

  allocated_storage     = var.allocated_storage
  storage_type          = var.storage_type

  engine                      = var.engine
  engine_version              = var.engine_version
  apply_immediately           = var.apply_immediately
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window

  instance_class         = var.instance_class
  deletion_protection    = var.deletion_protection
  port                   = var.port
  publicly_accessible    = var.publicly_accessible
  vpc_security_group_ids = [ aws_security_group.postgres_sg.id ]

  username             = var.username
  password             = var.password

  copy_tags_to_snapshot     = var.copy_tags_to_snapshot
  final_snapshot_identifier = "${var.project}-final-snapshot"
  skip_final_snapshot       = var.skip_final_snapshot

  multi_az             = var.multi_az
  db_subnet_group_name = var.db_subnet_group_name

  tags = {
      Name    = "${var.project}_rds"
      Project = var.project
  }
}

