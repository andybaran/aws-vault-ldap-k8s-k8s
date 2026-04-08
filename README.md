# aws-vault-ldap-k8s-k8s

Terraform Stacks repository for the shared AWS and Kubernetes foundation layer of the LDAP demo. This is the upstream stack for the split-repo layout and owns only `kube0` and `kube1`.

## Scope

- VPC, public/private subnets, NAT, and the shared internal security group
- EKS cluster creation, managed node group configuration, and cluster metadata outputs
- base Kubernetes prerequisites needed before downstream stacks run:
  - ingress-nginx with static public EIPs
  - the `vault-license` Kubernetes secret
  - the `vault-auth` service account and token review RBAC
- published stack outputs consumed by the AD, Vault, and app stacks

## Out of scope

- Active Directory / LDAP infrastructure
- Vault cluster runtime logic beyond the shared license secret and auth service account
- application workloads or any downstream stack implementation

## Components

- `modules/kube0` owns the AWS network, EKS cluster, shared internal security group, and foundation outputs.
- `modules/kube1` owns the Kubernetes bootstrap resources that should exist before the Vault and app stacks deploy.

## Deployment defaults

This repo assumes the following HCP Terraform defaults for the `development` deployment:

- organization: `andybaran`
- project display name: `ldap stack`
- project slug: `ldap-stack`
- region: `us-east-2`
- customer name: `fidelity`
- user email: `andy.baran@hashicorp.com`
- `eks_node_instance_type`: `c5.xlarge`
- `eks_node_ami_release_version`: `1.34.2-20260128`
- shared AWS creds varset: `varset-oUu39eyQUoDbmxE1`
- Vault license varset: `varset-fMrcJCnqUd6q4D9C`

The split repos intentionally do **not** default `destroy = true`.

## Downstream output contract

Published outputs in `deployments.tfdeploy.hcl`:

| Output | Description |
| --- | --- |
| `region` | AWS region for the shared platform deployment |
| `vpc_id` | Shared VPC ID |
| `public_subnet_id` | First public subnet ID |
| `private_subnet_id` | First private subnet ID |
| `shared_internal_sg_id` | Shared internal security group ID |
| `resources_prefix` | Prefix used across shared resources |
| `cluster_name` | Actual EKS cluster name |
| `cluster_id` | EKS cluster ID |
| `cluster_endpoint` | EKS API server endpoint |
| `cluster_ca_data` | Base64-encoded EKS cluster CA data |
| `kube_namespace` | Shared Kubernetes namespace from `kube1` |
| `demo_id` | Demo identifier derived by `kube0` |

A separate stack output, `cluster_kubeconfig_command`, keeps the human-friendly kubeconfig command without overloading `cluster_name`.

If you need to reference the stack address in docs or downstream repos, assume:

```
app.terraform.io/andybaran/ldap-stack/aws-vault-ldap-k8s-k8s
```

## Local validation

Run the repo formatting and validation commands from the repository root:

```bash
terraform fmt -recursive
terraform stacks fmt
terraform stacks init
terraform stacks validate
```
