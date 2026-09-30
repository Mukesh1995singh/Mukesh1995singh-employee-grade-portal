output "aks_id" {
  description = "Resource ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "Kubernetes configuration for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}