variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "tags" {
  description = "Common tags"

  type = map(string)

  default = {
    Project   = "CST8918 Final Project"
    Group     = "Group 3"
    ManagedBy = "Terraform"
  }
}