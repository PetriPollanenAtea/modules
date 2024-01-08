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

variable "nsg_rules" {
  description = "Network Security Group rules"
  type = map(object({
    name = string
    priority = number
    direction = string
    access = string
    protocol = string
    source_port_range = string
    destination_port_range = string
    source_address_prefix = string
    destination_address_prefix = string
  }))
}