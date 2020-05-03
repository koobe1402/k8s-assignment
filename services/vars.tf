variable project {
  default = "demo"
}

variable aws_account {
  default = "637999332513"
}

variable "aws_availability_zones" {
  description = "AWS availability zones use by the project"
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

