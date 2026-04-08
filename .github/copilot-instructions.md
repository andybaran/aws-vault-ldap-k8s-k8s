---
applyTo: "*.tf,*.hcl,*.md"
---

# Project: aws-vault-ldap-k8s-k8s

## Goal

Own the shared AWS and Kubernetes platform layer of the LDAP demo. This repo is the upstream Terraform Stacks repository for sibling stacks and owns only `kube0` and `kube1`.

## Scope

- stack root files at the repository root
- `modules/kube0` for VPC, subnets, shared security group, and EKS cluster resources
- `modules/kube1` for ingress-nginx, the Vault license secret, and shared Kubernetes auth primitives
- published outputs consumed by downstream stacks

## Non-scope

- Vault cluster runtime modules
- Active Directory / LDAP infrastructure
- application workloads or downstream stack logic

## Guardrails

- Keep this repository in Terraform Stacks form; do not replace the root with plain Terraform.
- Preserve the shared AWS creds varset `varset-oUu39eyQUoDbmxE1` in deployments.
- Preserve the Vault license varset flow for `kube1` via `varset-fMrcJCnqUd6q4D9C`.
- Use repo-specific names like `eks_node_instance_type` instead of the monolith's generic `instance_type`.
- Keep `cluster_name` as the actual EKS cluster name and expose the kubeconfig helper separately as `cluster_kubeconfig_command`.
- Treat the published outputs in `deployments.tfdeploy.hcl` as a stable downstream contract and update the README when that contract changes.
- Do not add downstream stack wiring or application logic here.
- Validate changes with `terraform fmt -recursive`, `terraform stacks fmt`, `terraform stacks init`, and `terraform stacks validate`.
