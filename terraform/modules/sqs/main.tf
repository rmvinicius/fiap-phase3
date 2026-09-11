resource "aws_kms_key" "sqs" {
  description             = "KMS key for SQS queue encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name        = "sqs-kms-key"
    Environment = var.environment
  }
}

resource "aws_kms_alias" "sqs" {
  name          = "alias/sqs-queue"
  target_key_id = aws_kms_key.sqs.key_id
}

resource "aws_sqs_queue" "queue" {
  name                       = var.sqs_name
  delay_seconds              = var.sqs_delay_seconds
  max_message_size           = var.sqs_max_message_size
  message_retention_seconds  = var.sqs_message_retention_seconds
  receive_wait_time_seconds  = var.sqs_receive_wait_time_seconds
  visibility_timeout_seconds = var.sqs_visibility_timeout_seconds
  kms_master_key_id          = aws_kms_key.sqs.arn

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
    maxReceiveCount     = var.sqs_max_receive_count
  })

  tags = {
    Name        = var.sqs_name
    Environment = var.environment
  }
}

resource "aws_sqs_queue" "terraform_queue_deadletter" {
  name                       = "${var.sqs_name}-deadletter"
  message_retention_seconds  = var.sqs_message_retention_seconds
  receive_wait_time_seconds  = var.sqs_receive_wait_time_seconds
  visibility_timeout_seconds = var.sqs_visibility_timeout_seconds
  kms_master_key_id          = aws_kms_key.sqs.arn

  tags = {
    Name        = "${var.sqs_name}-deadletter"
    Environment = var.environment
  }
}