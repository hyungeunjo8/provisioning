resource "aws_dynamodb_table" "dynamodb" {
    name           = var.dynamodb_name
    read_capacity  = 0
    write_capacity = 0
    billing_mode   = "PAY_PER_REQUEST"

    hash_key  = "instanceId"

    attribute {
        name = "instanceId"
        type = "S"
    }
}