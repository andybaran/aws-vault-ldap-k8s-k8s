---
applyTo: "*.tf,*.hcl,*.md"
---

# Project: aws-vault-ldap-k8s-k8s

## Goal

Own the shared AWS and Kubernetes platform layer of the demo. The end-to-end system still uses Terraform Cloud Stacks to demonstrate Vault rotating AD credentials for an app on EKS, and this repo should provide the network and cluster foundation for the other stacks.

## Scope

- VPC, subnets, security groups, and EKS cluster infrastructure
- shared Kubernetes prerequisites such as namespaces, ingress, and platform identities
- stack outputs consumed by the AD, Vault, and app repos

## Guardrails

- Keep using Terraform Stacks root files; do not replace the stack layout with plain Terraform.
- Keep this repo focused on platform concerns. Do not move Vault runtime logic, AD domain logic, or app-specific workload code here.
- Treat outputs consumed by sibling stacks as a stable contract and document changes in the README.
- Prefer pinned provider/module versions and straightforward demo-friendly infrastructure choices.
- When contracts change, reflect them in both HCL output descriptions and repo documentation.
