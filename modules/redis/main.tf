resource "aws_elasticache_serverless_cache" "example" {
  engine = "redis"
  name   = "example"
  cache_usage_limits {
    data_storage {
      maximum = 10
      unit    = "GB"
    }
    ecpu_per_second {
      maximum = 5000
    }
  }
  daily_snapshot_time      = "09:00"
  description              = "Test Server"
  kms_key_id               = aws_kms_key.test.arn
  major_engine_version     = "7"
  snapshot_retention_limit = 1
  security_group_ids       = [aws_security_group.test.id]
  subnet_ids               = aws_subnet.test[*].id
}