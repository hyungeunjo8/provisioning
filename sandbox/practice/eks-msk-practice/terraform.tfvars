# region
aws_region = "ap-northeast-2"

# vpc
vpc_name = "hgjo-vpc-msk-practice"
vpc_cidr = "10.196.0.0/16"

#subnet
az              = ["ap-northeast-2a", "ap-northeast-2c"]
public_subnets  = ["10.196.0.0/24", "10.196.1.0/24"]
private_subnets = ["10.196.100.0/24", "10.196.101.0/24"]

# eks
eks_cluster_name    = "hgjo-eks-cluster-msk-practice"
eks_cluster_version = "1.21"

# msk
msk_cluster_name = "hgjo-msk-cluster-msk-practice"
kafka_version    = "2.6.2"