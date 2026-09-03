variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "redis_cache_name" {
  type    = string
}

variable "redis_description" {
  type    = string
}

variable "redis_security_group_ids" {
  type = list(string)
}

variable "redis_subnet_ids" {
  type = list(string)
}

variable "redis_node_type" {
  type    = string
}

variable "redis_num_cache_nodes" {
  type    = number
  default = 1
}

variable "redis_parameter_group_name" {
  type    = string
}

variable "redis_engine" {
  type    = string
}

variable "redis_version" {
  type    = string
}

variable "redis_retention_limit" {
  type    = string
}

variable "redis_snapshot_window" {
  type    = string
}

variable "redis_maintenance_window" {
  type    = string
}