# ---------------------------------------------------------------------------
# modules/redis/variables.tf
# Inputs for one Azure Cache for Redis instance.
# Called once per environment (test, prod) with different sizing.
# ---------------------------------------------------------------------------

variable "name" {
  description = "Globally-unique Redis name (used in the hostname <name>.redis.cache.windows.net). Lowercase alphanumeric and hyphens."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group that will hold the Redis instance."
  type        = string
}

variable "location" {
  description = "Azure region for Redis (e.g. canadacentral)."
  type        = string
  default     = "canadacentral"
}

variable "environment" {
  description = "Environment name (test or prod). Used for tagging."
  type        = string

  validation {
    condition     = contains(["test", "prod", "dev"], var.environment)
    error_message = "environment must be test, prod, or dev."
  }
}

# --- Sizing -----------------------------------------------------------------
# capacity + family + sku_name together choose the tier and size.
#   Basic/Standard families use family = "C" (C0..C6).
#   Premium family uses  family = "P" (P1..P5).
#
# Defaults below suit test (Basic C0 = cheapest). Override for prod.

variable "capacity" {
  description = "Size within the family. For family C: 0-6 (C0 is smallest ~250MB). For family P: 1-5."
  type        = number
  default     = 0
}

variable "family" {
  description = "Redis family: C (Basic/Standard) or P (Premium)."
  type        = string
  default     = "C"

  validation {
    condition     = contains(["C", "P"], var.family)
    error_message = "family must be C (Basic/Standard) or P (Premium)."
  }
}

variable "sku_name" {
  description = "Redis tier: Basic, Standard, or Premium. Standard gives an SLA (replicated); Basic is single-node and best for test only."
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku_name)
    error_message = "sku_name must be Basic, Standard, or Premium."
  }
}

variable "non_ssl_port_enabled" {
  description = "Whether to expose the non-TLS port 6379. Keep false — force encrypted connections on port 6380."
  type        = bool
  default     = false
}

variable "minimum_tls_version" {
  description = "Minimum TLS version accepted by Redis."
  type        = string
  default     = "1.2"
}

variable "tags" {
  description = "Extra tags applied to the Redis instance."
  type        = map(string)
  default     = {}
}
