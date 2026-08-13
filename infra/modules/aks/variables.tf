variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.32"
}

variable "node_count" {
  description = "Initial number of nodes"
  type        = number
  default     = 1
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling"
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "VM size for the nodes"
  type        = string
  default     = "Standard_B2s"
}

variable "subnet_id" {
  description = "Subnet ID for the AKS cluster"
  type        = string
}

variable "enable_auto_scaling" {
  description = "Enable autoscaling for the node pool"
  type        = bool
  default     = false
}

variable "acr_id" {
  description = "ACR ID for image pull permissions"
  type        = string
  default     = null
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
