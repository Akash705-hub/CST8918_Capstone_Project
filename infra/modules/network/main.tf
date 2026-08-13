resource "azurerm_resource_group" "network" {

  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "main" {

  name                = var.vnet_name
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name

  address_space = [
    "10.0.0.0/14"
  ]

  tags = var.tags
}

resource "azurerm_subnet" "prod" {

  name                 = "prod-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = [
    "10.0.0.0/16"
  ]
}

resource "azurerm_subnet" "test" {

  name                 = "test-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = [
    "10.1.0.0/16"
  ]
}

resource "azurerm_subnet" "dev" {

  name                 = "dev-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = [
    "10.2.0.0/16"
  ]
}

resource "azurerm_subnet" "admin" {

  name                 = "admin-subnet"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = [
    "10.3.0.0/16"
  ]
}