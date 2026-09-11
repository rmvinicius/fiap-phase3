resource "aws_kms_key" "dynamodb" {
  description             = "KMS key for DynamoDB table ${var.dynamodb_table_name}"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name        = "${var.dynamodb_table_name}-kms-key"
    Environment = var.environment
  }
}

resource "aws_kms_alias" "dynamodb" {
  name          = "alias/${var.dynamodb_table_name}-dynamodb"
  target_key_id = aws_kms_key.dynamodb.key_id
}

resource "aws_dynamodb_table" "dynamodb" {
  name           = var.dynamodb_table_name
  billing_mode   = var.dynamodb_billing_mode
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
  hash_key       = var.dynamodb_hash_key
  range_key      = var.dynamodb_range_key

  dynamic "attribute" {
    for_each = var.dynamodb_attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  server_side_encryption {
    enabled     = false
    kms_key_arn = aws_kms_key.dynamodb.arn
  }

  point_in_time_recovery {
    enabled = false
  }

  tags = {
    Name        = var.dynamodb_table_name
    Environment = var.environment
  }
}