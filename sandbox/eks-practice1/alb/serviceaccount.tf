module "iam_eks_role" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = var.eks_pod_iam_role_for_service_accounts_name

  oidc_providers = {
    main = {
      provider_arn = "arn:aws:iam::${var.account_id}:oidc-provider/${replace(data.terraform_remote_state.eks.outputs.eks_cluster_oidc_issuer_url, "https://", "")}"
      namespace_service_accounts = ["default:${var.eks_pod_service_account_name}"]
    }
  }
  role_policy_arns = {
    AmazonS3FullAccess = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    AmazonDynamoDBFullAccess = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  }
}

resource "kubernetes_service_account" "service-accounts" {
  metadata {
    name = "${var.eks_pod_service_account_name}"
    namespace = "default"
    annotations = {
      "eks.amazonaws.com/role-arn" = "arn:aws:iam::${var.account_id}:role/${var.eks_pod_iam_role_for_service_accounts_name}"
    }
  }
}