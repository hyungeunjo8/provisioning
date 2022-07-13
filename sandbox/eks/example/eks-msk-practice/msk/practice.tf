module "example_eks_msk__practice" {
    source = "../../../_modules/msk"

    msk_cluster_name = "hgjo-msk-practice-4"
    kafka_version = "2.6.2"

    vpc_private_subnets = data.terraform_remote_state.eks.outputs.vpc_private_subnets
    vpc_vpc_id = data.terraform_remote_state.eks.outputs.vpc_vpc_id
    vpc_cidr_block = data.terraform_remote_state.eks.outputs.vpc_cidr_block
}