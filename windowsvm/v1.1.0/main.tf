# Create network interface for VM
resource "azurerm_network_interface" "wvm_nic" {
  for_each = var.wvms
  location = var.location
  resource_group_name = var.resource_group_name
  name = "nic-${each.value.name}"
  ip_configuration {
    name = "ipconfig1"
    subnet_id = "${var.vnet_id}/subnets/${each.value.subnet_name}"
    #subnet_id = data.azurerm_subnet.network[each.value.subnet_name].id
    private_ip_address_allocation = "Dynamic"
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
    publisher = var.source_image_publisher
    offer = var.source_image_offer
    sku = var.source_image_sku
    version = var.source_image_version
  }
  computer_name = "vm-${each.value.name}"
  admin_username = var.wvm_admin_username
  admin_password = random_password.wvm_admin_password.result
}
