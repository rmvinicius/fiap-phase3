output "vpc_id" {
    value = aws_vpc.main.id
}

output "subnet_ids" {
    value = values(aws_subnet.subnets)[*].id
}