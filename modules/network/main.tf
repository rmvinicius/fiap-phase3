# VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_ipv4_block
  instance_tenancy = var.vpc_instance_tenancy
  region = var.aws_region

  tags = {
    Name = "main"
  }
}

# Create multiples subnets
resource "aws_subnet" "subnets" {
  for_each          = var.subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = each.key

  tags = {
    Name = "subnet-${each.key}"
  }
}
