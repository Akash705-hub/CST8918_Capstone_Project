data "azurerm_subnet" "prod" {
  name                 = "prod-subnet"
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_container_registry" "acr" {
  name                = "cst8918acr"
  resource_group_name = "cst8918-final-project-group-3"
}

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }

  # Uncomment below after running bootstrap to create the backend
  backend "azurerm" {
     resource_group_name  = "cst8918-final-project-group-3"
     storage_account_name = "finalprojectbackend"
     container_name       = "tfstate"
     key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}


# Production AKS Cluster
module "aks_prod" {
  source = "../../modules/aks"

  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.aks_prod_cluster_name

  kubernetes_version  = var.kubernetes_version
  node_count          = var.aks_prod_node_count
  min_node_count      = var.aks_prod_min_node_count
  max_node_count      = var.aks_prod_max_node_count
  vm_size             = var.vm_size
  enable_auto_scaling = var.aks_prod_enable_auto_scaling

  subnet_id = data.azurerm_subnet.prod.id
  acr_id    = data.azurerm_container_registry.acr.id

  tags = merge(local.common_tags, { Environment = "prod" })

  depends_on = [data.azurerm_container_registry.acr]
}

# Production Redis Cache
module "redis_prod" {
  source = "../../modules/redis"

  resource_group_name = var.resource_group_name
  location            = var.location
  redis_name          = var.redis_prod_name

  capacity            = var.redis_prod_capacity
  family              = var.redis_family
  sku_name            = var.redis_sku_name
  minimum_tls_version = var.redis_minimum_tls_version

  tags = merge(local.common_tags, { Environment = "prod" })
}

locals {
  common_tags = {
    Project     = "CST8918 Final Project"
    Environment = "prod"
    Group       = "Group 3"
    ManagedBy   = "Terraform"
  }
}
