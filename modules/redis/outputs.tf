# ---------------------------------------------------------------------------
# modules/redis/outputs.tf
# The app needs: hostname, SSL port, and the access key.
# Keys are marked sensitive so they are redacted in plan/apply logs.
# In a real pipeline these feed a Kubernetes Secret, not a plaintext env var.
# ---------------------------------------------------------------------------

output "id" {
  description = "Resource ID of the Redis instance."
  value       = azurerm_redis_cache.this.id
}

output "hostname" {
  description = "Redis hostname, e.g. cst8918-g3-redis-test.redis.cache.windows.net"
  value       = azurerm_redis_cache.this.hostname
}

output "ssl_port" {
  description = "TLS port (6380). Use this from the app."
  value       = azurerm_redis_cache.this.ssl_port
}

output "primary_access_key" {
  description = "Primary access key. Sensitive — inject via a Kubernetes Secret."
  value       = azurerm_redis_cache.this.primary_access_key
  sensitive   = true
}

output "primary_connection_string" {
  description = "Full primary connection string. Sensitive."
  value       = azurerm_redis_cache.this.primary_connection_string
  sensitive   = true
}
