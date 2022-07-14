module "alb_practice" {
  source = "../../../eks/_modules/alb"

  aws_region = "ap-northeast-2"
  account_id = "692609349536"

  lb_controller_policy_name_prefix   = "AWSLoadBalancerControllerIAMPolicy"
  lb_controller_image_url            = "602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/amazon/aws-load-balancer-controller"
  lb_controller_iam_role_name        = "inhouse-eks-practice-aws-lb-ctrl"
  lb_controller_service_account_name = "aws-load-balancer-controller"

  eks_cluster_endpoint                   = data.terraform_remote_state.eks.outputs.eks_cluster_endpoint
  eks_cluster_certificate_authority_data = data.terraform_remote_state.eks.outputs.eks_cluster_certificate_authority_data
  eks_cluster_id                         = data.terraform_remote_state.eks.outputs.eks_cluster_id
  vpc_vpc_id                             = data.terraform_remote_state.eks.outputs.vpc_vpc_id
  eks_cluster_oidc_issuer_url            = data.terraform_remote_state.eks.outputs.eks_cluster_oidc_issuer_url
}
