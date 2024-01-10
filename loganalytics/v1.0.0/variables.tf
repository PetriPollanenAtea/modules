variable "location" {
  type        = string
  description = "Region of Azure to use for resources."
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group to use."
}

variable "name" {
  type        = string
  description = "Name of virtual network to create."
}

variable "sku" {
  type = string
  description = "Log Analytics Workspace SKU"
}

variable "retention" {
  type = number
  description = "Log Analytics Workspace retention in days"
  default = 30
}

variable "dces" {
  type = map(object({
    description = "Azure Monitor Data Collection Endpoints"
    name = string
    kind = string
  }))
}

/*
variable "dcrs" {
  type = map(object({
    name = string
    data_collection_endpoint_id
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
*/