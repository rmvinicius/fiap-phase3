resource "aws_dynamodb_table" "toggle_analytics" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  range_key      = var.range_key

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  tags = merge({
    Name        = var.table_name
    Environment = var.environment
  }, var.tags)
}