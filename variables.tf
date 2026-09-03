###############
### TAGS
###############
variable "environment" {
    type = string
}


# Região AWS
variable "aws_region" {
  default = "us-east-1"
}

###############
### NETWORK
###############
variable "vpc_name" {
    type = string
}

variable "vpc_ipv4_block" {
  type = string
}

variable "vpc_instance_tenancy" {
  type = string
}

variable "subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
  description = "Map with name, CIDR and AZ for each subnet"
}

variable "igw_name" {
    type = string
}
variable "eip_name" {
    type = string
}
variable "nat_gateway_name" {
    type = string
}
variable "route_table_public_name" {
    type = string
}
variable "route_table_private_name" {
    type = string
}

variable "eip_enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Enable NAT Gateway for private subnets"
}

# SECURITY GROUP
variable "security_group_priv_name" {
  type        = string
  description = "Name of the private security group"
}

variable "security_group_priv_description" {
  type        = string
  description = "Name of the private security group"
}

variable "security_group_pub_name" {
  type        = string
  description = "Name of the public security group"
}

variable "security_group_pub_description" {
  type        = string
  description = "Name of the public security group"
}
###############

###############
### SQS
###############
variable "sqs_name" {
  type = string
}

variable "sqs_delay_seconds" {
  type    = number
}

variable "sqs_max_message_size" {
  type    = number
}

variable "sqs_message_retention_seconds" {
  type    = number
}

variable "sqs_receive_wait_time_seconds" {
  type    = number
}

variable "sqs_visibility_timeout_seconds" {
  type    = number
}

variable "sqs_max_receive_count" {
  type    = number
}
###############

###############
### RDS Postgres
###############
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
###############

###############
### EKS
###############
variable "eks_cluster_name" {
  type    = string
}

variable "eks_cluster_version" {
  type    = string 
}

variable "eks_subnet_ids" {
  type = list(string)
}

variable "eks_node_groups" {
  type = list(object({
    name         = string
    instance_type = string
    desired_size  = number
    min_size      = number
    max_size      = number
  }))
}
###############

###############
### DYNAMODB
###############
variable "dynamodb_table_name" {
  type    = string
}

variable "dynamodb_billing_mode" {
  type    = string
}

variable "dynamodb_read_capacity" {
  type    = number
}

variable "dynamodb_write_capacity" {
  type    = number
}


variable "dynamodb_hash_key" {
  type    = string
}

variable "dynamodb_range_key" {
  type    = string
}

variable "dynamodb_attributes" {
  type = list(object({
    name = string
    type = string
  }))
}
###############

###############
### REDIS
###############
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
###############