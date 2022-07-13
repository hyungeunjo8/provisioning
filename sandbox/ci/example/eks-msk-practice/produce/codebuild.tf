module "example_codebuild" {
    source = "../../../_modules"
    aws_region = "ap-northeast-2"
    account_id = "692609349536"
    codebuild_name = "hgjo-msk-produce"
    github_repo = "https://github.com/hyungeunjo8/eks-fargate-practice"
    image_tag = "produce"
    source_version = "feature/msk-produce-practice"
    ecr_repository_name = "hgjo-msk-produce"
}