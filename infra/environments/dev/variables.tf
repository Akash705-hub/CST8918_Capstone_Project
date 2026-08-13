variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada Central"
}

# Network variables
variable "network_resource_group_name" {
  description = "Resource Group name for network"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}
