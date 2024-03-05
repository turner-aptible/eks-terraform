# VPC Outputs

output "vpc_name" {
  description = "Name of the new VPC"
  value       = module.vpc.name
}

output "vpc_public_cidrs" {
  description = "VPC Public CIDR Blocks"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "vpc_private_cidrs" {
  description = "VPC Private CIDR Blocks"
  value       = module.vpc.private_subnets_cidr_blocks
}

# EKS Outputs
output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.aws_region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_cert_authority" {
  description = "Kubernetes Cluster Certificate Authority"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

# Post Creation Outputs
output "kube_config_command" {
  value = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}

output "aws_sts_command" {
  value = "aws sts assume-role --role-arn ${aws_iam_role.eks_kubectl_role.arn} --role-session-name kubectl"
}