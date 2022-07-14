module "service_account_practice" {
  source = "../../../eks/_modules/serviceaccount"

  aws_region                                 = "ap-northeast-2"
  account_id                                 = "692609349536"
  eks_pod_service_account_name               = "hgjo-service-account-eks-practice"
  eks_pod_iam_role_for_service_accounts_name = "hgjo-service_account-iam-role-eks-practice"

  eks_cluster_id              = data.terraform_remote_state.eks.outputs.eks_cluster_id
  eks_cluster_oidc_issuer_url = data.terraform_remote_state.eks.outputs.eks_cluster_oidc_issuer_url

  eks_service_account_policy = {
    AmazonS3FullAccess       = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    AmazonDynamoDBFullAccess = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  }
}
