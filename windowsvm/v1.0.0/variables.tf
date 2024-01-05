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

variable "wvms" {
  type = map(object({
    name = string
    subnet_id = number
    subnet_name = string
    nic = string
  }))
}

variable "wvm_size" {
  type = string
}

variable "wvm_admin_username" {
  type = string
}

variable "vnet_id" {
  type = string
}