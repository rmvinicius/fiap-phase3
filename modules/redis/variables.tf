variable "environment" {
  type = string
}

variable "cache_name" {
  type    = string
  default = "redis-dev-01"
}

variable "description" {
  type    = string
  default = "Redis development cache"
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "node_type" {
  type    = string
  default = "cache.t3.micro"
}

variable "num_cache_nodes" {
  type    = number
  default = 1
}

variable "parameter_group_name" {
  type    = string
  default = "default.redis6.x"
}