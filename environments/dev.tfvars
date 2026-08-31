# Region
aws_region    = "us-east-1"

# AWS Credentials
access_key    = "valor" 
secret_key    = "valor" 
token         = "valor" 

# Backend tfstate
bucket_name     = "tech-challenge"
bucket_key      = "terraform/dev/tech-challenge-3.tfstate"
dynamodb_lock   = "terraform-dev-locks"
encrypt         = true

# Network
vpc_ipv4_block = "10.0.0.0/16"
vpc_instance_tenancy = "default"
subnets = {
    "snet-dev-aks-01" = "10.0.0.0/24"
    "snet-dev-aks-01" = "10.0.0.0/24"
    "snet-dev-aks-01" = "10.0.0.0/24"
}