data "azurerm_subnet" "test" {
  name                 = "test-subnet"
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
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
     key                  = "test.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}


# ACR Module
module "acr" {
  source = "../../modules/acr"

  resource_group_name = var.resource_group_name
  location            = var.location
  registry_name       = var.acr_name

  sku           = var.acr_sku
  admin_enabled = var.acr_admin_enabled

  tags = local.common_tags
}

# Test AKS Cluster
module "aks_test" {
  source = "../../modules/aks"

  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.aks_test_cluster_name

  kubernetes_version  = var.kubernetes_version
  node_count          = var.aks_test_node_count
  min_node_count      = var.aks_test_min_node_count
  max_node_count      = var.aks_test_max_node_count
  vm_size             = var.vm_size
  enable_auto_scaling = var.aks_test_enable_auto_scaling

  subnet_id = data.azurerm_subnet.test.id
  acr_id    = module.acr.registry_id

  tags = merge(local.common_tags, { Environment = "test" })

  depends_on = [module.acr]
}

# Test Redis Cache
module "redis_test" {
  source = "../../modules/redis"

  resource_group_name = var.resource_group_name
  location            = var.location
  redis_name          = var.redis_test_name

  capacity            = var.redis_test_capacity
  family              = var.redis_family
  sku_name            = var.redis_sku_name
  minimum_tls_version = var.redis_minimum_tls_version

  tags = merge(local.common_tags, { Environment = "test" })
}

locals {
  common_tags = {
    Project     = "CST8918 Final Project"
    Environment = "test"
    Group       = "Group 3"
    ManagedBy   = "Terraform"
  }
}
