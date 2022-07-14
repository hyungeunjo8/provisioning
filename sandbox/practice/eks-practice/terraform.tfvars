# region
aws_region = "ap-northeast-2"

# vpc
vpc_name = "hgjo-vpc-eks-practice"
vpc_cidr = "10.194.0.0/16"

#subnet
az              = ["ap-northeast-2a", "ap-northeast-2c"]
public_subnets  = ["10.194.0.0/24", "10.194.1.0/24"]
private_subnets = ["10.194.100.0/24", "10.194.101.0/24"]

# eks
eks_cluster_name    = "hgjo-eks-cluster-eks-practice"
eks_cluster_version = "1.21"

# s3
bucket_name = "hgjo-bucket-eks-practice"

# dynamo
dynamodb_name = "hgjo-dynamo-eks-practice"