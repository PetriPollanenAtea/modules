resource "azurerm_network_security_group" "nsg" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.nsg_name
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each = var.nsg_subnets
  subnet_id = "${var.vnet_id}/subnets/${each.value}"
  network_security_group_id = azurerm_network_security_group.nsg.id
}