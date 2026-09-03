resource "aws_db_instance" "rds" {
  for_each = { for db in var.rds_database_instances : db.name => db }

  region               = var.aws_region
  allocated_storage    = var.rds_allocated_storage
  db_name              = each.value.rds_db_name
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  username             = each.value.rds_username
  password             = each.value.rds_password
  parameter_group_name = var.rds_parameter_group_name
  skip_final_snapshot  = var.rds_skip_final_snapshot

  tags = {
    Name        = each.value.rds_db_name
    Environment = var.environment
  }
}