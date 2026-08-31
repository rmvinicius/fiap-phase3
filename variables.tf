# Região AWS
variable "aws_region" {
  default = "us-east-1"
}

# Credentials AWS
variable "access_key" {
  description = "Access Key from LABAWS"
  type        = string
}

variable "secret_key" {
  description = "Access Key from LABAWS"
  type        = string
}

variable "token" {
  description = "Access Key from LABAWS"
  type        = string
}

# TFSTATE

variable "bucket_name" {
  description = "Bucket name to tfstate"
  type        = string
}

variable "bucket_key" {
  description = "Bucket key to tfstate"
  type        = string
}

variable "dynamodb_lock" {
  description = "Table to lock tfstate"
  type        = string
}

variable "encrypt" {
  description = "to encrypt data"
  type        = bool
}


# NETWORK
variable "vpc_ipv4_block" {
  type = "string"
}

variable "vpc_instance_tenancy" {
  type = "string"
}

variable "subnets" {
  type = map(string)
}







# ID da AMI a ser usada
#variable "ami_id" {
#  description = "AMI utilizada nas instâncias"
#  type        = string
#}
#
## CIDR da VPC principal
#variable "vpc_cidr" {
#  default = "10.0.0.0/16"
#}
#
## Subnets (zona -> CIDR)
#variable "subnets" {
#  type = map(string)
#  default = {
#    "us-east-1a" = "10.0.1.0/24"
#    "us-east-1b" = "10.0.2.0/24"
#  }
#}
#
## Instâncias a serem criadas com for_each
#variable "instances" {
#  type = map(string)
#  default = {
#    "api"   = "t2.micro"
#    "cache" = "t3.small"
#  }
#}
#
## Flag de ambiente
#variable "is_production" {
#  default = false
#}
#
## Habilita ou não criação de NAT Gateway
#variable "enable_nat" {
#  default = false
#}
#
## Regras de segurança a serem aplicadas dinamicamente
#variable "ingress_rules" {
#  type = list(object({
#    from_port   = number
#    to_port     = number
#    protocol    = string
#    cidr_blocks = list(string)
#  }))
#  default = [
#    {
#      from_port   = 22
#      to_port     = 22
#      protocol    = "tcp"
#      cidr_blocks = ["0.0.0.0/0"]
#    },
#    {
#      from_port   = 80
#      to_port     = 80
#      protocol    = "tcp"
#      cidr_blocks = ["0.0.0.0/0"]
#    }
#  ]
#}
