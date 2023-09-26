resource "azurerm_virtual_network" "network" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.vnet_name

  address_space = var.vnet_address_space
}

resource "azurerm_subnet" "network" {
  for_each             = var.subnets
  resource_group_name  = azurerm_virtual_network.network.resource_group_name
  name                 = each.key
  virtual_network_name = azurerm_virtual_network.network.name

  address_prefixes = [each.value]
}