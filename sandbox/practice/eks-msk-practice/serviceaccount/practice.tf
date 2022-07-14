module "example_alb" {
  source = "../../../_modules/eks/alb"

  account_id = "692609349536"

  eks_cluster_oidc_issuer_url = data.terraform_remote_state.eks.outputs.eks_cluster_oidc_issuer_url

  eks_service_account_policy = {
    AmazonS3FullAccess       = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    AmazonDynamoDBFullAccess = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  }
  eks_pod_service_account_name               = "hgjo-eks-practice-cluster-service-account-7"
  eks_pod_iam_role_for_service_accounts_name = "hgjo-eks-practice-cluster-iam-role-for-service-accounts-7"
}
