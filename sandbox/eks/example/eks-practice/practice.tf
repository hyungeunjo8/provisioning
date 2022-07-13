# eks + dynamodb + s3
# terraform apply
# cd alb & terraform apply
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
}

module "example_s3" {
    source = "../../_modules/s3"
    
    aws_region = "ap-northeast-2"
    bucket_name = "hgjo-bucket-7"

    vpc_id = module.example_eks_practice.vpc_vpc_id
    vpc_private_route_table_ids = module.example_eks_practice.vpc_private_route_table_ids
}

module "example_dynamodb" {
    source = "../../_modules/dynamodb"

    aws_region = "ap-northeast-2"
    dynamodb_name = "hgjo-dynamodb-7"

    vpc_id = module.example_eks_practice.vpc_vpc_id
    vpc_private_route_table_ids = module.example_eks_practice.vpc_private_route_table_ids
}