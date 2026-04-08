# aws-vault-ldap-k8s-k8s

Terraform Cloud Stacks scaffold for the AWS networking and Kubernetes platform slice of the `aws-vault-ldap-k8s` demo.

This repository is intended to own the shared VPC, EKS cluster, ingress/platform prerequisites, and other Kubernetes-adjacent infrastructure that the rest of the demo depends on. It should remain the platform foundation repo for the split-stack design.

## Stack purpose

- provision the shared AWS networking and EKS platform
- establish common Kubernetes prerequisites consumed by sibling stacks
- publish platform outputs through linked stacks for AD, Vault, and app repos

## Upstream linked-stack contract

This scaffold assumes no required upstream linked stack. Deployment inputs should come directly from Terraform Cloud Stacks deployment values and varsets such as `region`, `customer_name`, `user_email`, `instance_type`, and AWS credentials.

## Downstream linked-stack contract

Planned outputs for downstream stacks:

- VPC, subnet, and shared security group identifiers for `aws-vault-ldap-k8s-ad`
- cluster name, endpoint, and CA data for `aws-vault-ldap-k8s-vault`
- Kubernetes namespace, ingress, and app-facing platform metadata for `aws-vault-ldap-k8s-app`
- any shared naming/prefix values needed across all sibling stacks

## Terraform Cloud Stacks

This repo is scaffolded around Terraform Stacks root files:

- `components.tfcomponent.hcl`
- `providers.tfcomponent.hcl`
- `variables.tfcomponent.hcl`
- `deployments.tfdeploy.hcl`

The HCL files are placeholders only. Later todos should add the actual platform components, provider pins, and linked-stack output wiring.
