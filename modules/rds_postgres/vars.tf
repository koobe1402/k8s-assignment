variable "db_subnet_group_name" {}

variable "multi_az" {
  default = false
}

variable "skip_final_snapshot" {
  default = true
}

variable "copy_tags_to_snapshot" {
  default = true
}

variable "password" {}

variable "username" {}

variable "publicly_accessible" {}

variable "port" {}

variable "deletion_protection" {}

variable "instance_class" {}

variable "backup_retention_period" {}

variable "backup_window" {}

variable "maintenance_window" {}

variable "allow_major_version_upgrade" {}

variable "auto_minor_version_upgrade" {}

variable "engine" {}

variable "engine_version" {}

variable "apply_immediately" {}

variable "storage_type" {}

variable "allocated_storage" {}

variable "db_identifier" {}

variable "project" {}

variable "vpc_id" {}

variable "eks_worker_sg_id" {}

