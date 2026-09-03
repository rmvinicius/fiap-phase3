###############
### TAGS
###############
environment = "Desenvolvimento"
###############

###############
### REGION
###############
aws_region    = "us-east-1"
###############

###############
### NETWORK
###############
vpc_name = "vpc-dev"
vpc_ipv4_block = "10.0.0.0/16"
vpc_instance_tenancy = "default"
eip_enable_nat_gateway   = true
subnets = {
    "snet-dev-aks-1a" = { cidr = "10.0.0.0/23", az = "us-east-1a" }
    "snet-dev-aks-1b" = { cidr = "10.0.2.0/23", az = "us-east-1b" }
    "snet-dev-rds-1a" = { cidr = "10.0.4.0/24", az = "us-east-1a" }
    "snet-dev-rds-1b" = { cidr = "10.0.5.0/24", az = "us-east-1b" }
    "snet-dev-pve-1a" = { cidr = "10.0.6.0/24", az = "us-east-1a" }
    "snet-dev-pve-1b" = { cidr = "10.0.7.0/24", az = "us-east-1b" }
    "snet-dev-pub-1a" = { cidr = "10.0.200.0/24", az = "us-east-1a" }
}
security_group_priv_name = "nsg-dev-priv-01"
security_group_priv_description = "Security group for private network"
security_group_pub_name = "nsg-dev-pub-01"
security_group_pub_description = "Security group for public network"
igw_name = "igw-dev"
eip_name = "eip-nat-dev"
nat_gateway_name = "nat-gw-dev"
route_table_public_name = "rt-public-dev"
route_table_private_name = "rt-private-dev"
###############

###############
### SQS
###############
sqs_name = "queue-toggle-master"
sqs_delay_seconds = 90
sqs_max_message_size = 2048
sqs_message_retention_seconds = 86400
sqs_receive_wait_time_seconds = 10
sqs_visibility_timeout_seconds = 30
sqs_max_receive_count = 4
###############

### RDS POSTGRES
rds_database_instances = 
rds_allocated_storage = 20
rds_instance_class = "db.t3.micro"
rds_engine = "postgres"
rds_engine_version = "15"
rds_parameter_group_name = "definir" 
rds_skip_final_snapshot = "true"

### EKS

eks_cluster_name = "eks-dev-01"
eks_cluster_version = "1.35"
eks_subnet_ids = 
eks_node_groups = 

###############
### DYNAMODB
###############
dynamodb_table_name = "ToggleMasterAnalytics"
dynamodb_billing_mode = "PAY_PER_REQUEST"
dynamodb_read_capacity = 20
dynamodb_write_capacity = 20
dynamodb_hash_key = "id"
dynamodb_range_key = "timestamp"
dynamodb_attributes = [
    {
      name = "id"
      type = "S"
    },
    {
      name = "timestamp"
      type = "S"
    }
  ]

###############