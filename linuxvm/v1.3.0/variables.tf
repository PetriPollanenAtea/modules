variable "location" {
  type        = string
  description = "Region of Azure to use for resources."
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group to use."
}

variable "nic_subnets" {
  type        = list(string)
  description = "Name of subnet and address prefix"
}

variable "lvms" {
  type = map(object({
    name = string
    subnet_id = number
    subnet_name = string
    nic = string
    pip_enable = bool
    ama_enable = bool
    auto_shutdown_enable = bool
    auto_shutdown_time = string
    auto_shutdown_timezone = string
    source_image_publisher = string
    source_image_offer = string
    source_image_sku = string
    source_image_version = string
  }))
}

variable "lvm_size" {
  type = string
}

variable "lvm_admin_username" {
  type = string
}

variable "vnet_id" {
  type = string
}
