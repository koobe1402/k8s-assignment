variable "project" {}

variable "security_groups" {
  type = list(string)
}

variable "vpc_id" {}

variable "subnets_ids" {}

variable "eks_endpoint" {}

variable "kubeconfig_ca_data" {}

variable "cluster_name" {}

variable "asg_desired_capacity" {}

variable "asg_max_size" {}

variable "asg_min_size" {}

variable "instance_type" {}

variable "ec2_key_name" {}

variable "ami_id" {}

