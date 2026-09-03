# Consome módulo local de rede
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

module "sqs" {
  source                          = "./modules/sqs"
  environment                     = var.environment
  sqs_name                        = var.sqs_name
  sqs_delay_seconds               = var.sqs_delay_seconds
  sqs_max_message_size            = var.sqs_max_message_size
  sqs_message_retention_seconds   = var.sqs_message_retention_seconds
  sqs_receive_wait_time_seconds   = var.sqs_receive_wait_time_seconds
  sqs_visibility_timeout_seconds  = var.sqs_visibility_timeout_seconds
  sqs_max_receive_count           = var.sqs_max_receive_count
}

module "rds" {
  source = "./modules/rds"
  environment = var.environment
  rds_database_instances = var.rds_database_instances
  rds_allocated_storage = var.rds_allocated_storage
  rds_instance_class = var.rds_instance_class
  rds_engine = var.rds_engine
  rds_engine_version = var.rds_engine_version
  rds_parameter_group_name = var.rds_parameter_group_name
  rds_skip_final_snapshot = var.rds_skip_final_snapshot
}

module "eks" {
  source = "./modules/eks"
  environment = var.environment
  eks_cluster_name = var.eks_cluster_name
  eks_cluster_version = var.eks_cluster_version
  eks_subnet_ids = var.eks_subnet_ids
  eks_node_groups = var.eks_node_groups
}

module "dynamodb" {
  source = "./modules/dynamodb"
  environment = var.environment
  dynamodb_table_name = var.dynamodb_table_name
  dynamodb_hash_key = var.dynamodb_hash_key
  dynamodb_range_key = var.dynamodb_range_key
  dynamodb_attributes = var.dynamodb_attributes
  dynamodb_billing_mode = var.dynamodb_billing_mode
}