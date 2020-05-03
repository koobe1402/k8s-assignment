variable "project" {}

variable "aws_availability_zones" {
  type = list
}

variable "private_subnet_cidrs" {
  type = list
}

variable "nat_gw_ids" {
  type = list
}

variable "vpc_id" {}

