variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "registry_name" {
  description = "Name of the Container Registry"
  type        = string
}

variable "sku" {
  description = "ACR pricing tier. Standard is the sensible default for this project."
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be one of: Basic, Standard, Premium."
  }
}

variable "admin_enabled" {
  description = "Enable admin user for Container Registry"
  type        = bool
  default     = false
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
