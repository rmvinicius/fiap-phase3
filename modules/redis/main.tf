resource "aws_elasticache_replication_group" "redis" {
  replication_group_description = var.redis_description
  replication_group_id          = var.redis_cache_name
  node_type                     = var.redis_node_type
  num_cache_clusters            = var.redis_num_cache_nodes
  engine                        = var.redis_engine
  engine_version                = var.redis_version
  parameter_group_name          = var.redis_parameter_group_name
  security_group_ids            = var.redis_security_group_ids
  subnet_group_name             = aws_redis_elasticache_subnet_group.redis_subnet_group.name
  snapshot_retention_limit      = var.redis_retention_limit
  snapshot_window               = var.redis_snapshot_window
  maintenance_window            = var.redis_maintenance_window

  tags = {
    Name        = var.redis_cache_name
    Environment = var.environment
  }
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "${var.cache_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.cache_name}-subnet-group"
    Environment = var.environment
  }
}