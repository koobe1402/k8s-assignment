module "eks_asg" {
  source = "../asg"

  ami_id               = var.ami_id
  ec2_key_name         = var.ec2_key_name
  instance_type        = var.instance_type
  asg_min_size         = var.asg_min_size
  asg_max_size         = var.asg_max_size
  asg_desired_capacity = var.asg_desired_capacity
  user_data            = data.template_cloudinit_config.eks_worker_user_data_template.rendered

  iam_instance_profile = aws_iam_instance_profile.eks_worker_instance_profile.name

  subnets_ids = var.subnets_ids

  security_groups = concat(
                      var.security_groups,
                      [
                        aws_security_group.eks_worker_sg.id
                      ]
                    )

  associate_public_ip_address = false

  project    = var.project
}

