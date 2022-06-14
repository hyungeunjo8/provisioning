# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = var.vpc_name

    cidr = "10.194.0.0/16"

    azs             = var.az
    public_subnets  = var.public_subnets
    private_subnets = var.private_subnets

    enable_nat_gateway     = true
    one_nat_gateway_per_az = true


    # https://aws.amazon.com/ko/premiumsupport/knowledge-center/eks-load-balancer-controller-subnets/
    public_subnet_tags = {
        "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
        "kubernetes.io/role/elb"                      = "1"
    }
    
    private_subnet_tags = {
        "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
        "kubernetes.io/role/internal-elb"             = "1"
    }

}