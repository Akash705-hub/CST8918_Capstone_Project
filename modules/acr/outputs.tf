# ---------------------------------------------------------------------------
# modules/acr/outputs.tf
# ---------------------------------------------------------------------------

output "id" {
  description = "Resource ID of the ACR. Use this as the scope for extra role assignments."
  value       = azurerm_container_registry.this.id
}

output "name" {
  description = "Name of the ACR."
  value       = azurerm_container_registry.this.name
}

output "login_server" {
  description = "Login server FQDN (e.g. cst8918group3acr.azurecr.io). This is the image prefix used in the Kubernetes deployment and the GitHub Actions docker build/push."
  value       = azurerm_container_registry.this.login_server
}
