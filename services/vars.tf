variable project {
  default = "demo"
}

variable aws_account {
  default = "637999332513"
}

variable "aws_region" {
  description = "AWS region usde by the project"
  default     = "eu-west-1"
}

variable "aws_availability_zones" {
  description = "AWS availability zones used by the project"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR for the Public Subnets"
  type        = list
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR for the Private Subnets"
  type        = list
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "eks_version" {
  default = "1.15"
}

variable "eks_public_access_cidrs" {
  description = "k8s API whitelist"
  default     = [
                  "0.0.0.0/0", #everywhere
                ]
}

variable "eks_ami_id" {
  default = "ami-02955144c3a2cb6a1"
}

variable "eks_ssh_key_name" {
  default = "demo"
}

variable "eks_instance_type" {
  default = "t3.small"
}

variable "eks_asg_min_size" {
  default = "2"
}

variable "eks_asg_max_size" {
  default = "2"
}

variable "eks_asg_desired_capacity" {
  default = "2"
}

variable "rds_allocated_storage" {
  default = "10"
}

variable "rds_storage_type" {
  default = "gp2"
}

variable "engine_version" {
  default = "11.4"
}

variable "instance_class" {
  default = "db.t3.small"
}

variable "deletion_protection" {
  default = false
}

variable "username" {
  default = "postgres"
}

variable "publicly_accessible" {
  default = false
}

variable "port" {
  default = "5432"
}

variable "maintenance_window" {
  default = "Mon:03:00-Mon:06:00"
}

variable "backup_window" {
  default = "01:37-02:07"
}

variable "backup_retention_period" {
  default = "7"
}

variable "allow_major_version_upgrade" {
  default = false
}

variable "auto_minor_version_upgrade" {
  default = true
}

variable "apply_immediately" {
  default = false
}

variable "allocated_storage" {
  default = "10"
}

variable "storage_type" {
  default = "gp2"
}

variable "engine" {
  default = "postgres"
}

