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

variable "bucket_name" {
}

variable "dynamodb_name" {
}