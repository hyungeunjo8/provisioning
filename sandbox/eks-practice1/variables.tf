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