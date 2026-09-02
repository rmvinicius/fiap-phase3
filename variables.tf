# TAGS
variable "environment" {
    type = string
}
variable "vpc_name" {
    type = string
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

# Região AWS
variable "aws_region" {
  default = "us-east-1"
}

# NETWORK
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

variable "enable_nat_gateway" {
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

# SQS
variable "sqs_name" {
    type = string
}

# RDS Postgres
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
  default = 20
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
  default = true
}