# ---------------------------------------------------------------------------
# modules/acr/variables.tf
# Inputs for the shared Azure Container Registry.
# The module is self-contained: it takes the resource group + location as
# inputs, so it works whether or not the network module is merged yet.
# ---------------------------------------------------------------------------

variable "name" {
  description = "Globally-unique ACR name. Must be 5-50 chars, lowercase alphanumeric only (no hyphens)."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{5,50}$", var.name))
    error_message = "ACR name must be 5-50 lowercase alphanumeric characters, no hyphens or symbols."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group that will hold the ACR."
  type        = string
}

variable "location" {
  description = "Azure region for the ACR (e.g. canadacentral)."
  type        = string
  default     = "canadacentral"
}

variable "sku" {
  description = "ACR pricing tier. Standard is the sensible default for this project."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be one of: Basic, Standard, Premium."
  }
}

variable "admin_enabled" {
  description = "Whether to enable the built-in admin user. Keep false: AKS pulls with its managed identity, which is the secure, industry-standard approach."
  type        = bool
  default     = false
}

variable "acr_pull_principal_ids" {
  description = "List of principal (object) IDs that should be granted AcrPull. Pass the kubelet identities of the test and prod AKS clusters here so the clusters can pull images without credentials."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags applied to the ACR."
  type        = map(string)
  default     = {}
}
