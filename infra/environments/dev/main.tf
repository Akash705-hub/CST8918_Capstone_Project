terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cst8918-final-project-group-3"
    storage_account_name = "finalprojectbackend"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

# Network Module
module "network" {
  source = "../../modules/network"

  resource_group_name = var.network_resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name

  tags = local.common_tags
}

locals {
  common_tags = {
    Project     = "CST8918 Final Project"
    Environment = "dev"
    Group       = "Group 3"
    ManagedBy   = "Terraform"
  }
}
