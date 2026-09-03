resource "aws_dynamodb_table" "toggle_analytics" {
  name           = var.dynamodb_table_name
  billing_mode   = var.dynamodb_billing_mode
  hash_key       = var.dynamodb_hash_key
  range_key      = var.dynamodb_range_key

  dynamic "attribute" {
    for_each = var.dynamodb_attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  tags = {
    Name        = var.dynamodb_table_name
    Environment = var.environment
  }
}