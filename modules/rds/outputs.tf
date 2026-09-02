output "database_endpoints" {
  value = { for k, v in aws_db_instance.databases : k => v.endpoint }
}

output "database_arns" {
  value = { for k, v in aws_db_instance.databases : k => v.arn }
}