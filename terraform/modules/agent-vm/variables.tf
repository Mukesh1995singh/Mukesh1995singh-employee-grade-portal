variable "vm_name" {
  description = "Name of the Azure DevOps self-hosted agent VM"
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

variable "subnet_id" {
  description = "Subnet ID for the agent VM"
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the agent VM"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the agent VM"
  type        = string
  sensitive   = true
}