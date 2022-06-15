aws_region = "ap-northeast-2"
account_id = "692609349536"

vpc_name = "hgjo-eks-practice-4"
vpc_cidr = "10.194.0.0/16"

az = [ "ap-northeast-2a", "ap-northeast-2c" ]
public_subnets = [ "10.194.0.0/24", "10.194.1.0/24" ]
private_subnets = [ "10.194.100.0/24", "10.194.101.0/24" ]

eks_cluster_name = "hgjo-eks-practice-cluster-4"
lb_controller_policy_name_prefix = "AWSLoadBalancerControllerIAMPolicy"
lb_controller_image_url = "602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/amazon/aws-load-balancer-controller"
lb_controller_iam_role_name = "inhouse-eks-aws-lb-ctrl"
lb_controller_service_account_name = "aws-load-balancer-controller"
eks_pod_service_account_name = "hgjo-eks-practice-cluster-service-account-1"
eks_pod_iam_role_for_service_accounts_name = "hgjo-eks-practice-cluster-iam-role-for-service-accounts-1"