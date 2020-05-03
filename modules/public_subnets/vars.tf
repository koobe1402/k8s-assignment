variable "vpc_id" {}

variable "igw_id" {}

variable "project" {}

variable "public_subnet_cidrs" {
  type = list
}

variable "aws_availability_zones" {
  type = list
}

