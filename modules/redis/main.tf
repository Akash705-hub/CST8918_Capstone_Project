# ---------------------------------------------------------------------------
# modules/redis/main.tf
# Managed Azure Cache for Redis used by the Remix Weather App to cache
# weather API responses. One instance per environment.
#
# WHY managed Redis instead of running Redis in a pod:
#   - No node to patch, no persistence to manage, built-in HA on Standard+.
#   - The app just needs a hostname + key; the platform owns the rest.
#
# NOTE on VNet integration: only the Premium SKU supports subnet injection.
# Basic/Standard (what we use for test/prod here) are reached over their
# public endpoint secured by TLS + access key, so this module does NOT take
# a subnet input. That keeps it decoupled from the network module.
# ---------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.100, < 5.0"
    }
  }
}

resource "azurerm_redis_cache" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  capacity = var.capacity
  family   = var.family
  sku_name = var.sku_name

  # Security hardening: TLS only.
  non_ssl_port_enabled = var.non_ssl_port_enabled
  minimum_tls_version  = var.minimum_tls_version

  tags = merge(
    {
      environment = var.environment
      application = "remix-weather-app"
    },
    var.tags
  )
}
