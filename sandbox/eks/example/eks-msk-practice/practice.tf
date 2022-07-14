# eks + msk
# terraform apply
# cd alb & terraform apply
# cd msk & terraform apply
module "example_eks_practice" {
    source = "../../_modules/eks"
    
    aws_region = "ap-northeast-2"
    account_id = "692609349536"
    
    vpc_name = "hgjo-eks-practice-7"
    vpc_cidr = "10.194.0.0/16"

    az = [ "ap-northeast-2a", "ap-northeast-2c" ]
    public_subnets = [ "10.194.0.0/24", "10.194.1.0/24" ]
    private_subnets = [ "10.194.100.0/24", "10.194.101.0/24" ]

    eks_cluster_name = "hgjo-eks-practice-cluster-7"
    eks_cluster_version = "1.21"
}