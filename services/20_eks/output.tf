locals {
  kubeconfig = <<KUBECONFIG

apiVersion: v1
clusters:
- cluster:
    server: "${module.eks_control_plane.endpoint}"
    certificate-authority-data: "${module.eks_control_plane.kubeconfig_ca_data}"
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      env:
      - name: "AWS_PROFILE"
        value: "k24s"
      args:
        - "token"
        - "-i"
        - "${module.eks_control_plane.cluster_name}"
KUBECONFIG
}

output "kubeconfig" {
  value = local.kubeconfig
}

