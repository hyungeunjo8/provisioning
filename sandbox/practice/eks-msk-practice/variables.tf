# region
variable "aws_region" {
}

# vpc
variable "vpc_name" {}
variable "vpc_cidr" {}

#subnet
variable "az" {
  type = list(string)
}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}

# eks
variable "eks_cluster_version" {}
variable "eks_cluster_name" {}

# msk
variable "msk_cluster_name" {}
variable "kafka_version" {}
