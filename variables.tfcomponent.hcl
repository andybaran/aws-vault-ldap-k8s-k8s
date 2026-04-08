variable "customer_name" {
  description = "Customer name used to derive shared platform resource names."
  type        = string
}

variable "region" {
  description = "AWS region for the shared platform deployment."
  type        = string
  default     = "us-east-2"
}

variable "eks_node_instance_type" {
  description = "EC2 instance type for the EKS managed node group."
  type        = string
  default     = "c5.xlarge"
}

variable "eks_node_ami_release_version" {
  description = "EKS managed node group AMI release version."
  type        = string
  default     = "1.34.2-20260128"
}

variable "user_email" {
  description = "User email used by kube0 for demo-specific AWS IAM role calculations."
  type        = string
  default     = "andy.baran@hashicorp.com"
}

variable "vault_license_key" {
  description = "Vault Enterprise license key written into the cluster by kube1."
  type        = string
  sensitive   = false
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key."
  type        = string
  ephemeral   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS sensitive secret access key."
  type        = string
  sensitive   = true
  ephemeral   = true
}

variable "AWS_SESSION_TOKEN" {
  description = "AWS session token."
  type        = string
  sensitive   = true
  ephemeral   = true
}
