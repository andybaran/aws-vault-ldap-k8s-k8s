store varset "aws_creds" {
  id       = "varset-oUu39eyQUoDbmxE1"
  category = "env"
}

store varset "vault_license" {
  id       = "varset-fMrcJCnqUd6q4D9C"
  category = "terraform"
}

deployment "development" {
  inputs = {
    region                       = "us-east-2"
    customer_name                = "fidelity"
    user_email                   = "andy.baran@hashicorp.com"
    eks_node_instance_type       = "c5.xlarge"
    eks_node_ami_release_version = "1.34.2-20260128"
    vault_license_key            = store.varset.vault_license.stable.vault_license_key

    AWS_ACCESS_KEY_ID     = store.varset.aws_creds.AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY = store.varset.aws_creds.AWS_SECRET_ACCESS_KEY
    AWS_SESSION_TOKEN     = store.varset.aws_creds.AWS_SESSION_TOKEN
  }
}

publish_output "region" {
  value = deployment.development.region
}

publish_output "vpc_id" {
  value = deployment.development.vpc_id
}

publish_output "public_subnet_id" {
  value = deployment.development.public_subnet_id
}

publish_output "private_subnet_id" {
  value = deployment.development.private_subnet_id
}

publish_output "shared_internal_sg_id" {
  value = deployment.development.shared_internal_sg_id
}

publish_output "resources_prefix" {
  value = deployment.development.resources_prefix
}

publish_output "cluster_name" {
  value = deployment.development.cluster_name
}

publish_output "cluster_id" {
  value = deployment.development.cluster_id
}

publish_output "cluster_endpoint" {
  value = deployment.development.cluster_endpoint
}

publish_output "cluster_ca_data" {
  value = deployment.development.cluster_ca_data
}

publish_output "kube_namespace" {
  value = deployment.development.kube_namespace
}

publish_output "demo_id" {
  value = deployment.development.demo_id
}
