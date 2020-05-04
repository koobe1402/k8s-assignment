variable "project" {}

variable "aws_alb_ingress_controller_docker_image" {
  default = "docker.io/amazon/aws-alb-ingress-controller"
}

variable "k8s_pod_annotations" {
  default ={}
}

variable "k8s_pod_labels" {
  default = {}
}

variable "k8s_replicas" {
  default = 1
}

variable "aws_alb_ingress_controller_version" {
  default = "1.1.6"
}

variable "k8s_namespace" {
  default = "kube-system"
}

variable "region" {}

variable "vpc_id" {}

variable "k8s_cluster_name" {}

variable "aws_alb_ingress_class" {
  default = "alb"
}

variable "oidc_provider_url" {}

variable "aws_account" {}

