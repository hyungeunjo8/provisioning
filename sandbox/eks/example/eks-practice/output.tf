output "eks_cluster_certificate_authority_data" {
  description = "cluster_certificate_authority_data"
  value       = module.example_eks_practice.eks_cluster_certificate_authority_data
}

output "eks_cluster_oidc_issuer_url" {
  description = "cluster_oidc_issuer_url"
  value       = module.example_eks_practice.eks_cluster_oidc_issuer_url
}

output "eks_cluster_endpoint" {
  description = "cluster_endpoint"
  value       = module.example_eks_practice.eks_cluster_endpoint
}

output "eks_cluster_id" {
  description = "cluster_id"
  value       = module.example_eks_practice.eks_cluster_id
}

output "vpc_vpc_id" {
  description = "cluster_id"
  value       = module.example_eks_practice.vpc_vpc_id
}

output "vpc_cidr_block" {
  description = "cidr_block"
  value       = module.example_eks_practice.vpc_cidr_block
}

output "vpc_private_subnets" {
  description = "subnetIds"
  value = module.example_eks_practice.vpc_private_subnets
}