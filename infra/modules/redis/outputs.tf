output "redis_id" {
  description = "Redis cache ID"
  value       = azurerm_redis_cache.redis.id
}

output "primary_connection_string" {
  description = "Redis primary connection string"
  value       = azurerm_redis_cache.redis.primary_connection_string
  sensitive   = true
}

output "secondary_connection_string" {
  description = "Redis secondary connection string"
  value       = azurerm_redis_cache.redis.secondary_connection_string
  sensitive   = true
}

output "hostname" {
  description = "Redis hostname"
  value       = azurerm_redis_cache.redis.hostname
}

output "ssl_port" {
  description = "Redis SSL port"
  value       = azurerm_redis_cache.redis.ssl_port
}
