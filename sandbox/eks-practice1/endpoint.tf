resource "aws_vpc_endpoint" "s3" {
    vpc_id       = module.vpc.vpc_id
    service_name = "com.amazonaws.${var.aws_region}.s3"
}

resource "aws_vpc_endpoint_route_table_association" "s3_endpoint_routetable" {
  count  = length(module.vpc.private_route_table_ids)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = module.vpc.private_route_table_ids[count.index]
}

resource "aws_vpc_endpoint" "dynamodb" {
    vpc_id       = module.vpc.vpc_id
    service_name = "com.amazonaws.${var.aws_region}.dynamodb"
}

resource "aws_vpc_endpoint_route_table_association" "dynamo_endpoint_routetable" {
  count  = length(module.vpc.private_route_table_ids)
  vpc_endpoint_id = aws_vpc_endpoint.dynamodb.id
  route_table_id  = module.vpc.private_route_table_ids[count.index]
}