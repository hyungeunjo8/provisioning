provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "arn:aws:eks:${var.aws_region}:${var.account_id}:cluster/${var.eks_cluster_name}"
}

module "eks" {
    source = "terraform-aws-modules/eks/aws"
    
    cluster_name    = var.eks_cluster_name
    cluster_version = "1.21"
    
    cluster_endpoint_private_access = false
    cluster_endpoint_public_access  = true

    cluster_addons = {
        coredns = {
            resolve_conflicts = "OVERWRITE"
        }
        kube-proxy = {
            resolve_conflicts = "OVERWRITE"
        }
        vpc-cni = {
            resolve_conflicts = "OVERWRITE"
        }
    }
    
    vpc_id     = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    cloudwatch_log_group_retention_in_days = 1

    # Fargate Profile(s)
    fargate_profiles = {
        default = {
        name = "default"
        selectors = [
                {
                    namespace = "kube-system"
                },
                {
                    namespace = "default"
                }
            ]
        }
    }
}
