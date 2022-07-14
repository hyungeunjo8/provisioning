module "example_alb" {
    source = "../../../_modules/eks/alb"

    aws_region = "ap-northeast-2"
    account_id = "692609349536"
    
    lb_controller_policy_name_prefix = "AWSLoadBalancerControllerIAMPolicy"
    lb_controller_image_url = "602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/amazon/aws-load-balancer-controller"
    lb_controller_iam_role_name = "inhouse-eks-aws-lb-ctrl"
    lb_controller_service_account_name = "aws-load-balancer-controller"

    eks_service_account_policy = {
        AmazonS3FullAccess = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
        AmazonDynamoDBFullAccess = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
    }
    eks_pod_service_account_name = "hgjo-eks-practice-cluster-service-account-7"
    eks_pod_iam_role_for_service_accounts_name = "hgjo-eks-practice-cluster-iam-role-for-service-accounts-7"

    eks_cluster_endpoint = data.terraform_remote_state.eks.outputs.eks_cluster_endpoint
    eks_cluster_certificate_authority_data = data.terraform_remote_state.eks.outputs.eks_cluster_certificate_authority_data
    eks_cluster_id = data.terraform_remote_state.eks.outputs.eks_cluster_id
    vpc_vpc_id = data.terraform_remote_state.eks.outputs.vpc_vpc_id
    eks_cluster_oidc_issuer_url = data.terraform_remote_state.eks.outputs.eks_cluster_oidc_issuer_url
}