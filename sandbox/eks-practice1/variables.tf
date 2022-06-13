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

variable "lb_controller_iam_role_name" {
}

variable "lb_controller_service_account_name" {
}