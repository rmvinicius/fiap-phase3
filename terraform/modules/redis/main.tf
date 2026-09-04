resource "aws_elasticache_serverless_cache" "redis" {
  name              = var.redis_cache_name
  description       = var.redis_description
  engine            = var.redis_engine
  major_engine_version = var.redis_version
  security_group_ids = var.redis_security_group_ids
  subnet_ids         = var.redis_subnet_ids

  tags = {
    Name = var.redis_cache_name
    Environment = var.environment
  }
}