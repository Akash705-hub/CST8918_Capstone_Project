variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Shared resource group for the project"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada Central"
}

# Network variables
variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

# ACR variables
variable "acr_name" {
  description = "Container Registry name"
  type        = string
}

variable "acr_sku" {
  description = "ACR SKU"
  type        = string
  default     = "Basic"
}

variable "acr_admin_enabled" {
  description = "Enable ACR admin user"
  type        = bool
  default     = false
}


variable "aks_test_cluster_name" {
  description = "Test AKS cluster name"
  type        = string
}

variable "aks_test_node_count" {
  description = "Initial node count for test AKS cluster"
  type        = number
  default     = 1
}

variable "aks_test_min_node_count" {
  description = "Minimum node count for test AKS cluster"
  type        = number
  default     = 1
}

variable "aks_test_max_node_count" {
  description = "Maximum node count for test AKS cluster"
  type        = number
  default     = 1
}

variable "aks_test_enable_auto_scaling" {
  description = "Enable autoscaling for test AKS cluster"
  type        = bool
  default     = false
}

# AKS general variables
variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.32"
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_B2s"
}

# Redis Test variables

variable "redis_test_name" {
  description = "Test Redis cache name"
  type        = string
}

variable "redis_test_capacity" {
  description = "Redis cache capacity for test"
  type        = number
  default     = 1
}

variable "redis_family" {
  description = "Redis cache family"
  type        = string
  default     = "C"
}

variable "redis_sku_name" {
  description = "Redis cache SKU"
  type        = string
  default     = "Basic"
}

variable "redis_enable_non_ssl_port" {
  description = "Enable non-SSL port for Redis"
  type        = bool
  default     = false
}

variable "redis_minimum_tls_version" {
  description = "Minimum TLS version for Redis"
  type        = string
  default     = "1.2"
}
