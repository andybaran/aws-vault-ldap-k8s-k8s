output "region" {
  description = "AWS region for the shared platform deployment."
  type        = string
  value       = var.region
}

output "vpc_id" {
  description = "VPC ID for the shared platform network."
  type        = string
  value       = component.kube0.vpc_id
}

output "public_subnet_id" {
  description = "First public subnet ID for shared platform resources."
  type        = string
  value       = component.kube0.first_public_subnet_id
}

output "private_subnet_id" {
  description = "First private subnet ID for shared platform resources."
  type        = string
  value       = component.kube0.first_private_subnet_id
}

output "shared_internal_sg_id" {
  description = "Security group ID shared across internal demo infrastructure."
  type        = string
  value       = component.kube0.shared_internal_sg_id
}

output "resources_prefix" {
  description = "Naming prefix derived for shared demo resources."
  type        = string
  value       = component.kube0.resources_prefix
}

output "cluster_name" {
  description = "Actual EKS cluster name."
  type        = string
  value       = component.kube0.cluster_name
}

output "cluster_id" {
  description = "EKS cluster ID."
  type        = string
  value       = component.kube0.cluster_id
}

output "cluster_endpoint" {
  description = "EKS control plane endpoint."
  type        = string
  value       = component.kube0.cluster_endpoint
}

output "cluster_ca_data" {
  description = "Base64-encoded EKS cluster certificate authority data."
  type        = string
  value       = component.kube0.cluster_ca_data
}

output "cluster_kubeconfig_command" {
  description = "Command to update a local kubeconfig for the EKS cluster."
  type        = string
  value       = component.kube0.cluster_kubeconfig_command
}

output "kube_namespace" {
  description = "Shared Kubernetes namespace created by kube1."
  type        = string
  value       = component.kube1.kube_namespace
}

output "demo_id" {
  description = "Demo identifier derived by kube0."
  type        = string
  value       = component.kube0.demo_id
}
