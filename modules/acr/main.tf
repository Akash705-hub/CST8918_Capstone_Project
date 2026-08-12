# ---------------------------------------------------------------------------
# modules/acr/main.tf
# One shared Azure Container Registry that both the test and prod AKS
# clusters pull the Remix Weather App image from.
#
# WHY one shared registry:
#   - It is how real teams do it: build the image once, promote the SAME
#     immutable image (tagged with the commit SHA) from test to prod.
#   - Cheaper and simpler than a registry per environment.
#   - Environment isolation is enforced at the AKS/network layer, not by
#     duplicating the registry.
# ---------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.100, < 5.0"
    }
  }
}

resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  # Disable the admin user. AKS authenticates with its managed identity
  # (see the AcrPull role assignment below), so we never handle passwords.
  admin_enabled = var.admin_enabled

  tags = var.tags
}

# Grant AcrPull to each AKS cluster's kubelet identity.
# This is what lets a cluster pull images with NO username/password.
resource "azurerm_role_assignment" "acr_pull" {
  for_each = toset(var.acr_pull_principal_ids)

  scope                            = azurerm_container_registry.this.id
  role_definition_name             = "AcrPull"
  principal_id                     = each.value
  skip_service_principal_aad_check = true
}
