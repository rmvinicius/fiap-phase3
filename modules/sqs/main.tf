resource "aws_sqs_queue" "queue" {
  name                       = var.sqs_name
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
    maxReceiveCount     = var.max_receive_count
  })

  tags = {
    Environment = var.environment
  }
}

resource "aws_sqs_queue" "terraform_queue_deadletter" {
  name                       = "${var.sqs_name}-deadletter"
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds

  tags = {
    Environment = var.environment
  }
}