variable "location" {
  type        = string
  description = "Region of Azure to use for resources."
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group to use."
}

variable "log_name" {
  type        = string
  description = "Name of virtual network to create."
}

variable "log_sku" {
  type = string
  description = "Log Analytics Workspace SKU"
}

variable "log_retention" {
  type = number
  description = "Log Analytics Workspace retention in days"
  default = 30
}