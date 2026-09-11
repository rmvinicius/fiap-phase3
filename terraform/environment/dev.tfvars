### TAGS
environment = "Desenvolvimento"

### REGION
aws_region = "us-east-1"

### NETWORK
vpc_name               = "vpc-dev-01"
vpc_ipv4_block         = "10.0.0.0/16"
vpc_instance_tenancy   = "default"
eip_enable_nat_gateway = true
subnets = {
  "snet-dev-aks-1a" = { cidr = "10.0.0.0/23", az = "us-east-1a" }
  "snet-dev-aks-1b" = { cidr = "10.0.2.0/23", az = "us-east-1b" }
  "snet-dev-rds-1a" = { cidr = "10.0.4.0/24", az = "us-east-1a" }
  "snet-dev-rds-1b" = { cidr = "10.0.5.0/24", az = "us-east-1b" }
  "snet-dev-pve-1a" = { cidr = "10.0.6.0/24", az = "us-east-1a" }
  "snet-dev-pve-1b" = { cidr = "10.0.7.0/24", az = "us-east-1b" }
  "snet-dev-pub-1a" = { cidr = "10.0.200.0/24", az = "us-east-1a" }
}
security_group_priv_name        = "nsg-dev-priv-01"
security_group_priv_description = "Security group for private network"
security_group_pub_name         = "nsg-dev-pub-01"
security_group_pub_description  = "Security group for public network"
igw_name                        = "igw-dev-01"
eip_name                        = "eip-nat-dev-01"
nat_gateway_name                = "nat-gw-dev-01"
route_table_public_name         = "rt-public-dev-01"
route_table_private_name        = "rt-private-dev-01"

### SQS
sqs_name                       = "queue-toggle-master"
sqs_delay_seconds              = 90
sqs_max_message_size           = 2048
sqs_message_retention_seconds  = 86400
sqs_receive_wait_time_seconds  = 10
sqs_visibility_timeout_seconds = 30
sqs_max_receive_count          = 4

### RDS POSTGRES
rds_database_instances = [
  {
    name     = "rds-dev-01"
    db_name  = "auth_db"
    username = "postgres"
    password = "postgres@2026"
  },
  {
    name     = "rds-dev-02"
    db_name  = "flags_db"
    username = "postgres"
    password = "postgres@2026"
  },
  {
    name     = "rds-dev-03"
    db_name  = "targeting_db"
    username = "postgres"
    password = "postgres@2026"
  }
]
rds_allocated_storage    = 20
rds_instance_class       = "db.t3.micro"
rds_engine               = "postgres"
rds_engine_version       = "17"
rds_parameter_group_name = "default.postgres17"
rds_skip_final_snapshot  = true
rds_subnet_name          = "rds-dev-subnet-group"

### EKS
eks_cluster_name    = "eks-dev-01"
eks_cluster_version = "1.36"
eks_node_groups = [
  {
    name          = "dev01"
    instance_type = "t3.medium"
    desired_size  = 2
    min_size      = 1
    max_size      = 4
  }
]

### DYNAMODB
dynamodb_table_name     = "ToggleMasterAnalytics"
dynamodb_billing_mode   = "PROVISIONED"
dynamodb_read_capacity  = 1
dynamodb_write_capacity = 1
dynamodb_hash_key       = "event_id"
dynamodb_range_key      = null
dynamodb_attributes = [
  {
    name = "event_id"
    type = "S"
  }
]

### REDIS
redis_cache_name  = "redis-dev-01"
redis_description = "Redis development cache"
redis_engine      = "redis" # or "valkey"
redis_version     = "7.2"

### ECR
ecr_repositories = [
  "analytics-service",
  "flag-service",
  "targeting-service",
  "auth-service",
  "evaluation-service",
  "helm/microservice",
]