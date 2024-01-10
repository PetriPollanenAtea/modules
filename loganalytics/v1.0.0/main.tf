resource "azurerm_log_analytics_workspace" "log" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.name
  sku                 = var.sku
  retention_in_days   = var.retention
}
