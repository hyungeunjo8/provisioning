# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = var.vpc_name

    cidr = "10.194.0.0/16"

    azs             = var.az
    public_subnets  = var.public_subnets
    private_subnets = var.private_subnets

    enable_nat_gateway     = true
    one_nat_gateway_per_az = true
}