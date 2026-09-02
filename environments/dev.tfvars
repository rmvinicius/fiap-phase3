# TAGS
environment = "Desenvolvimento"
vpc_name = "vpc-dev"
igw_name = "igw-dev"
eip_name = "eip-nat-dev"
nat_gateway_name = "nat-gw-dev"
route_table_public_name = "rt-public-dev"
route_table_private_name = "rt-private-dev"

### REGION
aws_region    = "us-east-1"

### NETWORK
vpc_ipv4_block = "10.0.0.0/16"
vpc_instance_tenancy = "default"
enable_nat_gateway   = true
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

### SQS
sqs_name = "queue-toggle-master"

### RDS POSTGRES
rds_database_instances = 
rds_allocated_storage = 20
rds_instance_class = "db.t3.micro"
rds_engine = "postgres"
rds_engine_version = "15"
rds_parameter_group_name = "definir" 
rds_skip_final_snapshot = "true"