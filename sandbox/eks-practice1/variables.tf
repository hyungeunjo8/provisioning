variable "aws_region" {
  
}
variable "account_id" {
}

variable "vpc_name" {
    description = "vpc-name"
}

variable "vpc_cidr" {
}

variable "az" {
    type = list(string)
}

variable "public_subnets" {
    type        = list(string)
}

variable "private_subnets" {
    type        = list(string)
}

variable "eks_cluster_name" {
}

variable "lb_controller_policy_name_prefix" {
}

variable "lb_controller_image_url" {
}

variable "lb_controller_iam_role_name" {
}

variable "lb_controller_service_account_name" {
}

variable "eks_pod_service_account_name" {
}

variable "eks_pod_iam_role_for_service_accounts_name" {
}