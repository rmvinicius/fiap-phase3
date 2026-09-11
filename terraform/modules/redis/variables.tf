variable "environment" {
  type = string
}

variable "redis_cache_name" {
  type = string
}

variable "redis_description" {
  type = string
}

variable "redis_security_group_ids" {
  type = list(string)
}

variable "redis_subnet_ids" {
  type = list(string)
}

variable "redis_engine" {
  type = string
}

variable "redis_version" {
  type = string
}