resource "azurerm_log_analytics_workspace" "log" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.name
  sku                 = var.sku
  retention_in_days   = var.retention
}

resource "azurerm_monitor_data_collection_endpoint" "dce" {
  # for_each = var.dces
  location = var.location
  resource_group_name = var.resource_group_name
  # name = "dce-${each.value.name}"
  name = "dce-${var.dce_name}"
  # kind = each.value.kind
  kind = var.dce_kind
}

/*
resource "azurerm_monitor_data_collection_rule" "dcr" {
  
}
*/