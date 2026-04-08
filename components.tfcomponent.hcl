component "kube0" {
  source = "./modules/kube0"

  inputs = {
    region                       = var.region
    customer_name                = var.customer_name
    user_email                   = var.user_email
    eks_node_instance_type       = var.eks_node_instance_type
    eks_node_ami_release_version = var.eks_node_ami_release_version
  }

  providers = {
    aws       = provider.aws.this
    random    = provider.random.this
    tls       = provider.tls.this
    null      = provider.null.this
    time      = provider.time.this
    cloudinit = provider.cloudinit.this
  }
}

component "eks_auth" {
  source = "./modules/eks_auth"

  inputs = {
    cluster_name = component.kube0.cluster_name
  }

  providers = {
    aws = provider.aws.this
  }
}

component "kube1" {
  source = "./modules/kube1"

  inputs = {
    demo_id                                 = component.kube0.demo_id
    cluster_endpoint                        = component.kube0.cluster_endpoint
    kube_cluster_certificate_authority_data = component.kube0.cluster_ca_data
    vault_license_key                       = var.vault_license_key
  }

  providers = {
    aws        = provider.aws.this
    kubernetes = provider.kubernetes.this
    helm       = provider.helm.this
    time       = provider.time.this
  }
}
