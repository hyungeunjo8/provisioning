aws_region = "ap-northeast-2"
account_id = "692609349536"

vpc_name = "hgjo-eks-practice-4"
vpc_cidr = "10.194.0.0/16"

az = [ "ap-northeast-2a", "ap-northeast-2c" ]
public_subnets = [ "10.194.0.0/24", "10.194.1.0/24" ]
private_subnets = [ "10.194.100.0/24", "10.194.101.0/24" ]

eks_cluster_name = "hgjo-eks-practice-cluster-4"
bucket_name = "hgjo-bucket-1"
dynamodb_name = "hgjo-dynamodb-1"