variable "project" {}

variable "ami_id" {}

variable "subnets_ids" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "associate_public_ip_address" {
  default = "False"
}

variable "instance_type" {}

variable "asg_max_size" {}

variable "asg_min_size" {}

variable "asg_desired_capacity" {}

variable "ec2_key_name" {}

variable "iam_instance_profile" {}

variable "user_data" {}

