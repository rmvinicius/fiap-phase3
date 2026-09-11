resource "aws_kms_key" "rds" {
  description             = "KMS key for RDS encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name        = "rds-kms-key"
    Environment = var.environment
  }
}

resource "aws_db_instance" "rds" {
  for_each = { for db in var.rds_database_instances : db.name => db }

  allocated_storage          = var.rds_allocated_storage
  db_name                    = each.value.db_name
  db_subnet_group_name       = aws_db_subnet_group.rds-subnet.name
  engine                     = var.rds_engine
  engine_version             = var.rds_engine_version
  instance_class             = var.rds_instance_class
  username                   = each.value.username
  password                   = each.value.password
  parameter_group_name       = var.rds_parameter_group_name
  skip_final_snapshot        = var.rds_skip_final_snapshot
  deletion_protection        = false
  storage_encrypted          = false
  kms_key_id                 = aws_kms_key.rds.arn
  multi_az                   = false
  copy_tags_to_snapshot      = false
  auto_minor_version_upgrade = false
  vpc_security_group_ids     = var.rds_security_group_ids
  performance_insights_enabled = false

  tags = {
    Name        = each.value.db_name
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "rds-subnet" {
  name       = var.rds_subnet_name
  subnet_ids = var.rds_subnet_ids

  tags = {
    Name        = var.rds_subnet_name
    Environment = var.environment
  }
}