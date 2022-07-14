# vpc + eks
# terraform init
# terraform apply
module "vpc_pracitce" {
  source = "../../vpc/_modules"

  aws_region = var.aws_region

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  az              = var.az
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  # https://aws.amazon.com/ko/premiumsupport/knowledge-center/eks-load-balancer-controller-subnets/
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"               = "1"
  }
}

module "eks_practice" {
  source = "../../eks/_modules"

  eks_cluster_name    = var.eks_cluster_name
  eks_cluster_version = var.eks_cluster_version

  vpc_id          = module.vpc_pracitce.vpc_vpc_id
  private_subnets = module.vpc_pracitce.vpc_private_subnets
}

module "msk_practice" {
  source = "../../msk/_modules"

  msk_cluster_name = var.msk_cluster_name
  kafka_version    = var.kafka_version

  vpc_private_subnets = module.vpc_pracitce.vpc_private_subnets
  vpc_vpc_id          = module.vpc_pracitce.vpc_vpc_id
  vpc_cidr_block      = module.vpc_pracitce.vpc_cidr_block
}
