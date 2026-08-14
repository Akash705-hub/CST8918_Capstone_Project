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

# AKS Prod Cluster variables
variable "aks_prod_cluster_name" {
  description = "Production AKS cluster name"
  type        = string
}

variable "aks_prod_node_count" {
  description = "Initial node count for prod AKS cluster"
  type        = number
  default     = 1
}

variable "aks_prod_min_node_count" {
  description = "Minimum node count for prod AKS cluster"
  type        = number
  default     = 1
}

variable "aks_prod_max_node_count" {
  description = "Maximum node count for prod AKS cluster"
  type        = number
  default     = 3
}

variable "aks_prod_enable_auto_scaling" {
  description = "Enable autoscaling for prod AKS cluster"
  type        = bool
  default     = true
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

# Redis Prod variables
variable "redis_prod_name" {
  description = "Production Redis cache name"
  type        = string
}

variable "redis_prod_capacity" {
  description = "Redis cache capacity for production"
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

variable "redis_minimum_tls_version" {
  description = "Minimum TLS version for Redis"
  type        = string
  default     = "1.2"
}
