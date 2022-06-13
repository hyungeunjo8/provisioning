vpc_name = "hgjo-eks-practice-1"
vpc_cidr = "10.194.0.0/16"
az = [ "ap-northeast-2a", "ap-northeast-2c" ]
public_subnets = [ "10.194.0.0/24", "10.194.1.0/24" ]
private_subnets = [ "10.194.100.0/24", "10.194.101.0/24" ]
eks_cluster_name = "hgjo-eks-practice-cluster-1"
lb_controller_iam_role_name = "inhouse-eks-aws-lb-ctrl"
lb_controller_service_account_name = "aws-load-balancer-controller"