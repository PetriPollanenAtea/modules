resource "azurerm_network_security_group" "nsg" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.nsg_name
}

resource "azurerm_network_security_rule" "nsg_rule" {
  for_each = var.nsg_rules
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
  name = each.value.name
  priority = each.value.priority
  direction = each.value.direction
  access = each.value.access
  protocol = each.value.protocol
  source_port_range = each.value.source_port_range
  source_address_prefix = each.value.source_address_prefix
  destination_port_range = each.value.destination_port_range
  destination_address_prefix = each.value.destination_address_prefix
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each = var.nsg_subnets
  subnet_id = "${var.vnet_id}/subnets/${each.value}"
  network_security_group_id = azurerm_network_security_group.nsg.id
}
