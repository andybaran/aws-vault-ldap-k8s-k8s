required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "6.27.0"
  }
  kubernetes = {
    source  = "hashicorp/kubernetes"
    version = "3.0.1"
  }
  helm = {
    source  = "hashicorp/helm"
    version = "3.1.1"
  }
  tls = {
    source  = "hashicorp/tls"
    version = "~> 4.0.5"
  }
  random = {
    source  = "hashicorp/random"
    version = "~> 3.6.0"
  }
  cloudinit = {
    source  = "hashicorp/cloudinit"
    version = "2.3.7"
  }
  null = {
    source  = "hashicorp/null"
    version = "3.2.4"
  }
  time = {
    source  = "hashicorp/time"
    version = "0.13.1"
  }
}

provider "aws" "this" {
  config {
    region     = var.region
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
    token      = var.AWS_SESSION_TOKEN
  }
}

provider "helm" "this" {
  config {
    kubernetes = {
      host                   = component.kube0.cluster_endpoint
      cluster_ca_certificate = base64decode(component.kube0.cluster_ca_data)
      token                  = component.kube0.eks_cluster_auth
    }
  }
}

provider "kubernetes" "this" {
  config {
    host                   = component.kube0.cluster_endpoint
    cluster_ca_certificate = base64decode(component.kube0.cluster_ca_data)
    token                  = component.kube0.eks_cluster_auth
  }
}

provider "tls" "this" {
}

provider "random" "this" {
}

provider "cloudinit" "this" {
}

provider "null" "this" {
}

provider "time" "this" {
}
