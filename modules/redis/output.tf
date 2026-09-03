output "redis_endpoint" {
  value = aws_elasticache_serverless_cache.redis.endpoint
}

output "redis_port" {
  value = aws_elasticache_serverless_cache.redis.port
}