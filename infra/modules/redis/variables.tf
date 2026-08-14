# ---------------------------------------------------------------------------
# Inputs for one Azure Cache for Redis instance.
# Called once per environment (test, prod) with different sizing.
# ---------------------------------------------------------------------------

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "redis_name" {
  description = "Name of the Redis cache"
  type        = string
}

variable "capacity" {
  description = "The size of the Redis cache to deploy"
  type        = number
  default     = 1
}

variable "family" {
  description = "The SKU family to use (C for Basic/Standard, P for Premium)"
  type        = string
  default     = "C"
}

variable "sku_name" {
  description = "The SKU of Redis to use (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}

variable "minimum_tls_version" {
  description = "Minimum TLS version"
  type        = string
  default     = "1.2"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)

  default = {
    Project   = "CST8918 Final Project"
    Group     = "Group 3"
    ManagedBy = "Terraform"
  }
}
