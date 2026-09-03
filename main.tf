###############
### MODULE NETWORK
###############
module "network" {
  source   = "./modules/network"
  vpc_ipv4_block = var.vpc_ipv4_block
  vpc_instance_tenancy = var.vpc_instance_tenancy
  aws_region = var.aws_region
  subnets  = var.subnets
  eip_enable_nat_gateway   = var.eip_enable_nat_gateway
  vpc_name = var.vpc_name
  environment = var.environment
  igw_name = var.igw_name
  eip_name = var.eip_name
  nat_gateway_name = var.nat_gateway_name
  route_table_public_name = var.route_table_public_name
  route_table_private_name = var.route_table_private_name
  security_group_priv_name = var.security_group_priv_name
  security_group_priv_description = var.security_group_priv_description
  security_group_pub_name = var.security_group_pub_name
  security_group_pub_description = var.security_group_pub_description
}
###############

###############
### MODULE SQS
###############
module "sqs" {
  source                          = "./modules/sqs"
  environment                     = var.environment
  aws_region                      = var.aws_region
  sqs_name                        = var.sqs_name
  sqs_delay_seconds               = var.sqs_delay_seconds
  sqs_max_message_size            = var.sqs_max_message_size
  sqs_message_retention_seconds   = var.sqs_message_retention_seconds
  sqs_receive_wait_time_seconds   = var.sqs_receive_wait_time_seconds
  sqs_visibility_timeout_seconds  = var.sqs_visibility_timeout_seconds
  sqs_max_receive_count           = var.sqs_max_receive_count
}
###############

###############
### MODULE RDS
###############
module "rds" {
  source = "./modules/rds"
  environment = var.environment
  aws_region                      = var.aws_region
  rds_database_instances = var.rds_database_instances
  rds_allocated_storage = var.rds_allocated_storage
  rds_instance_class = var.rds_instance_class
  rds_engine = var.rds_engine
  rds_engine_version = var.rds_engine_version
  rds_parameter_group_name = var.rds_parameter_group_name
  rds_skip_final_snapshot = var.rds_skip_final_snapshot
}
###############

###############
### MODULE EKS
###############
module "eks" {
  source = "./modules/eks"
  environment = var.environment
  aws_region                      = var.aws_region
  eks_cluster_name = var.eks_cluster_name
  eks_cluster_version = var.eks_cluster_version
  eks_subnet_ids = var.eks_subnet_ids
  eks_node_groups = var.eks_node_groups
}
###############

###############
### MODULE DYNAMODB
###############
module "dynamodb" {
  source = "./modules/dynamodb"
  environment = var.environment
  aws_region                      = var.aws_region
  dynamodb_table_name = var.dynamodb_table_name
  dynamodb_billing_mode = var.dynamodb_billing_mode
  dynamodb_read_capacity = var.dynamodb_read_capacity
  dynamodb_write_capacity = var.dynamodb_write_capacity
  dynamodb_hash_key = var.dynamodb_hash_key
  dynamodb_range_key = var.dynamodb_range_key
  dynamodb_attributes = var.dynamodb_attributes
}
###############

###############
### MODULE REDIS
###############
module "dynamodb" {
  source = "./modules/redis"
  environment = var.environment
  aws_region                      = var.aws_region
  redis_cache_name = var.redis_cache_name
  redis_description = var.redis_description
  redis_security_group_ids = var.redis_security_group_ids
  redis_subnet_ids = var.redis_subnet_ids
  redis_node_type = var.redis_node_type
  redis_num_cache_nodes = var.redis_num_cache_nodes
  redis_parameter_group_name = var.redis_parameter_group_name
  redis_engine = var.redis_engine
  redis_version = var.redis_version
  redis_retention_limit = var.redis_retention_limit
  redis_snapshot_window = var.redis_snapshot_window
  redis_maintenance_window = var.redis_maintenance_window
}
###############