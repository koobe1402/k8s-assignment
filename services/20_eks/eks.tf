data "aws_eks_cluster_auth" "aws_iam_authenticator" {
  name = module.eks_control_plane.cluster_name
}

provider "kubernetes" {
  host                   = module.eks_control_plane.endpoint
  cluster_ca_certificate = base64decode(module.eks_control_plane.kubeconfig_ca_data)
  token                  = data.aws_eks_cluster_auth.aws_iam_authenticator.token
  load_config_file       = false
}

module "eks_control_plane" {
  source = "../../modules/eks_control_plane"

  eks_version         = var.eks_version
  public_access_cidrs = var.eks_public_access_cidrs
  subnet_ids          = data.terraform_remote_state.network.outputs.private_subnets_ids
  region              = var.aws_region

  project  = var.project
}

module "eks_worker" {
  source = "../../modules/eks_worker"

  ami_id               = var.eks_ami_id
  ec2_key_name         = var.eks_ssh_key_name
  instance_type        = var.eks_instance_type
  asg_min_size         = var.eks_asg_min_size
  asg_max_size         = var.eks_asg_max_size
  asg_desired_capacity = var.eks_asg_desired_capacity

  cluster_name       = module.eks_control_plane.cluster_name
  kubeconfig_ca_data = module.eks_control_plane.kubeconfig_ca_data
  eks_endpoint       = module.eks_control_plane.endpoint

  subnets_ids = data.terraform_remote_state.network.outputs.private_subnets_ids
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  security_groups = [
                      module.eks_control_plane.security_group_id,
                    ]

  project    = var.project
}

module "aws_alb_ingress_controller" {
  source = "../../modules/alb-ingress-controller"

  oidc_provider_url = module.eks_control_plane.oidc_provider_url

  aws_account      = var.aws_account
  region           = var.aws_region
  vpc_id           = data.terraform_remote_state.network.outputs.vpc_id
  k8s_cluster_name = module.eks_control_plane.cluster_name

  project    = var.project
}

