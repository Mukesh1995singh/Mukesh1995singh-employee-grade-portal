output "resource_group_name" {
  description = "Azure Resource Group name"
  value       = module.resource_group.resource_group_name
}

output "vnet_id" {
  description = "Virtual Network ID"
  value       = module.network.vnet_id
}

output "aks_subnet_id" {
  description = "AKS subnet ID"
  value       = module.network.aks_subnet_id
}

output "acr_name" {
  description = "Azure Container Registry name"
  value       = module.acr.acr_name
}

output "acr_login_server" {
  description = "Azure Container Registry login server"
  value       = module.acr.acr_login_server
}

output "aks_name" {
  description = "AKS cluster name"
  value       = module.aks.aks_name
}

output "keyvault_name" {
  description = "Azure Key Vault name"
  value       = module.keyvault.keyvault_name
}

output "keyvault_uri" {
  description = "Azure Key Vault URI"
  value       = module.keyvault.keyvault_uri
}