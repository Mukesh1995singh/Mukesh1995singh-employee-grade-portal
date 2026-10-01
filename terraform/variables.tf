variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
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

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "acr_sku" {
  description = "SKU of the Azure Container Registry"
  type        = string
  default     = "Standard"
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "aks_node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 2
}

variable "aks_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D2as_v5"
}

variable "keyvault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "agent_subnet_name" {
  description = "Name of the Azure DevOps agent subnet"
  type        = string
}

variable "agent_subnet_address_prefixes" {
  description = "Address prefixes for the Azure DevOps agent subnet"
  type        = list(string)
}

variable "agent_vm_name" {
  description = "Name of the Azure DevOps self-hosted agent VM"
  type        = string
}

variable "agent_admin_username" {
  description = "Administrator username for the agent VM"
  type        = string
}

variable "agent_admin_password" {
  description = "Administrator password for the Azure DevOps agent VM"
  type        = string
  sensitive   = true
}