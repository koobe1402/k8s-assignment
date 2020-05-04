data "template_file" "eks_worker_user_data_script" {
  template = "${file("${path.module}/eks_worker_user_data.sh.tpl")}"

  vars = {
    endpoint              = var.eks_endpoint
    certificate_authority = var.kubeconfig_ca_data
    cluster-name          = "${var.project}_cluster"
  }
}

data "template_cloudinit_config" "eks_worker_user_data_template" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "eks_worker_user_data.sh"
    content_type = "text/x-shellscript"
    content      = "${data.template_file.eks_worker_user_data_script.rendered}"
  }
}

