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

variable "source_image_publisher" {
  type = string
}

variable "source_image_offer" {
  type = string
}

variable "source_image_sku" {
  type = string
}

variable "source_image_version" {
  type = string
}

variable "keyvault_id" {
  type = string
}