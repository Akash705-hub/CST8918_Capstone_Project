resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name

  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    auto_scaling_enabled = var.enable_auto_scaling
    min_count       = var.enable_auto_scaling ? var.min_node_count : null
    max_count       = var.enable_auto_scaling ? var.max_node_count : null
    vm_size         = var.vm_size
    vnet_subnet_id  = var.subnet_id
    upgrade_settings {
         max_surge = "10%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    service_cidr   = "10.10.0.0/16"
    dns_service_ip = "10.10.0.10"
  }

  tags = var.tags
}

# Role assignment for AKS cluster to pull images from ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope              = var.acr_id
  role_definition_name = "AcrPull"
  principal_id       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
