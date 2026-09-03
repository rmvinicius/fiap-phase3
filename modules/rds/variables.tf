variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "rds_database_instances" {
  type = list(object({
    name     = string
    db_name  = string
    username = string
    password = string
  }))
}

variable "rds_allocated_storage" {
  type    = number
}

variable "rds_instance_class" {
  type    = string
}

variable "rds_engine" {
  type    = string
}

variable "rds_engine_version" {
  type    = string
}

variable "rds_parameter_group_name" {
  type    = string
}

variable "rds_skip_final_snapshot" {
  type    = bool
}