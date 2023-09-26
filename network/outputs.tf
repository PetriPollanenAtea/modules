output "virtual_network_name" {
  value = azurerm_virtual_network.network.name
}

output "virtual_network_id" {
  value = azurerm_virtual_network.network.id
}

output "subnet_ids" {
  value = [for subnet in azurerm_subnet.network : subnet.id]
}