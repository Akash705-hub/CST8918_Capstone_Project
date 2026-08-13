variable "location" {
  description = "Azure region used for the Terraform backend."
  type        = string
  default     = "Canada Central"
}

variable "resource_group_name" {
  description = "Resource Group name for the Terraform backend."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique Storage Account name."
  type        = string
}

variable "container_name" {
  description = "Blob container used to store Terraform state."
  type        = string
  default     = "tfstate"
}

variable "tags" {
  description = "Common tags applied to Azure resources."

  type = map(string)

  default = {
    Project   = "CST8918 Final Project"
    ManagedBy = "Terraform"
    Owner     = "Group 3"
  }
}