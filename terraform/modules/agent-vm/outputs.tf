output "vm_id" {
  description = "ID of the Azure DevOps agent VM"
  value       = azurerm_linux_virtual_machine.agent.id
}

output "vm_name" {
  description = "Name of the Azure DevOps agent VM"
  value       = azurerm_linux_virtual_machine.agent.name
}

output "public_ip_address" {
  description = "Public IP address of the Azure DevOps agent VM"
  value       = azurerm_public_ip.agent.ip_address
}

output "private_ip_address" {
  description = "Private IP address of the Azure DevOps agent VM"
  value       = azurerm_network_interface.agent.private_ip_address
}