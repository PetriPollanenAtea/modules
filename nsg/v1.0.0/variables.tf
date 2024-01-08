variable "location" {
  type        = string
  description = "Region of Azure to use for resources."
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group to use."
}

variable "nsg_name" {
  type        = string
  description = "Name of virtual network to create."
}

variable "vnet_id" {
  type = string
}

variable "nsg_subnets" {
  type        = set(string)
  description = "Subnet ids"
}