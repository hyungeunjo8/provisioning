module "eks" {
    source = "terraform-aws-modules/eks/aws"
    
    cluster_name    = var.eks_cluster_name
    cluster_version = "1.21"
    
    cluster_endpoint_private_access = false
    cluster_endpoint_public_access  = true
    
    vpc_id     = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    cloudwatch_log_group_retention_in_days = 1

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

#core dns pending 시 처리
#https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/fargate-getting-started.html#fargate-gs-coredns

resource "aws_eks_addon" "coredns" {
  cluster_name = var.eks_cluster_name
  addon_name   = "coredns"
  resolve_conflicts = "OVERWRITE"

  depends_on = [
    module.eks
  ]
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name = var.eks_cluster_name
  addon_name   = "kube-proxy"
  resolve_conflicts = "OVERWRITE"

  depends_on = [
    module.eks
  ]
}

resource "aws_eks_addon" "vpc-cni" {
  cluster_name = var.eks_cluster_name
  addon_name   = "vpc-cni"
  resolve_conflicts = "OVERWRITE"

  depends_on = [
    module.eks
  ]
}