terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.81"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cst8918-final-project-group-3"
    storage_account_name = "finalprojectbackend"
    container_name       = "tfstate"
    key                  = "network.tfstate"
  }
}

provider "azurerm" {
  features {}
}