resource "aws_elasticache_replication_group" "redis" {
  replication_group_description = var.description
  replication_group_id          = var.cache_name
  node_type                     = var.node_type
  num_cache_clusters            = var.num_cache_nodes
  engine                        = "redis"
  engine_version                = "6.x"
  parameter_group_name          = var.parameter_group_name
  security_group_ids            = var.security_group_ids
  subnet_group_name             = aws_elasticache_subnet_group.redis_subnet_group.name
  snapshot_retention_limit      = 1
  snapshot_window               = "09:00-10:00"
  maintenance_window            = "sun:10:00-11:00"

  tags = {
    Name        = var.cache_name
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