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

resource "azurerm_container_registry" "acr" {
  name                = var.registry_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku           = var.sku
  admin_enabled = var.admin_enabled

  tags = var.tags
}
