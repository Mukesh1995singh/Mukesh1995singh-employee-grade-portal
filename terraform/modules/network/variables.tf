variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "address_space" {
  description = "Address space of the Virtual Network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the AKS subnet"
  type        = list(string)
}