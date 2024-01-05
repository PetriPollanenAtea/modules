# Create network interface for VM
resource "azurerm_public_ip" "wvm_pip" {
  for_each = {for p in var.wvms : p.name => p if p.pip_enable}
  location = var.location
  resource_group_name = var.resource_group_name
  name = "pip-${each.value.name}"
  allocation_method = "Static"
}

resource "azurerm_network_interface" "wvm_nic" {
  for_each = var.wvms
  location = var.location
  resource_group_name = var.resource_group_name
  name = "nic-${each.value.name}"
  ip_configuration {
    name = "ipconfig1"
    subnet_id = "${var.vnet_id}/subnets/${each.value.subnet_name}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = try(azurerm_public_ip.lvm_pip[each.key].id,null)
  }
}

# Create random password for VM Admin
resource "random_password" "wvm_admin_password" {
  length = 16
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


# Create Windows virtual machine
resource "azurerm_windows_virtual_machine" "wvm" {
  for_each = var.wvms
  location = var.location
  resource_group_name = var.resource_group_name
  name = "vm-${each.value.name}"
  network_interface_ids = [azurerm_network_interface.wvm_nic[each.value.nic].id,]
  size = var.wvm_size
  os_disk {
    name = "${each.key}_osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = each.value.source_image_publisher
    offer = each.value.source_image_offer
    sku = each.value.source_image_sku
    version = each.value.source_image_version
  }
  computer_name = "vm-${each.value.name}"
  admin_username = var.wvm_admin_username
  admin_password = random_password.wvm_admin_password.result
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "lvm_shutdown" {
  for_each = {for v in var.wvms : v.name => v if v.auto_shutdown_enable}
  # virtual_machine_id = [azurerm_linux_virtual_machine.lvm[each.value.name].id]
  virtual_machine_id = try(azurerm_linux_virtual_machine.lvm[each.key].id,null)
  location = var.location
  enabled = true
  daily_recurrence_time = each.value.auto_shutdown_time
  timezone = each.value.auto_shutdown_timezone
  notification_settings {
    enabled = false
  }
}