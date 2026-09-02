# Consome módulo local de rede
module "network" {
  source   = "./modules/network"
  vpc_ipv4_block = var.vpc_ipv4_block
  vpc_instance_tenancy = var.vpc_instance_tenancy
  aws_region = var.aws_region
  subnets  = var.subnets
  enable_nat_gateway   = var.enable_nat_gateway
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
  source = "./modules/sqs"
  environment = var.environment
  sqs_name = var.sqs_name
  aws_region = var.aws_region
}