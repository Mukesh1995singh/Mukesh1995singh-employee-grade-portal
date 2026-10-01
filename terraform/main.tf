module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source = "./modules/network"

  vnet_name               = var.vnet_name
  location                = var.location
  resource_group_name     = module.resource_group.resource_group_name
  address_space           = var.address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes

  agent_subnet_name             = var.agent_subnet_name
  agent_subnet_address_prefixes = var.agent_subnet_address_prefixes

  depends_on = [module.resource_group]
}


module "acr" {
  source = "./modules/acr"

  acr_name            = var.acr_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  sku                 = var.acr_sku

  depends_on = [
    module.resource_group
  ]
}

module "aks" {
  source = "./modules/aks"

  aks_name            = var.aks_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  dns_prefix          = var.aks_dns_prefix
  node_count          = var.aks_node_count
  vm_size             = var.aks_vm_size
  aks_subnet_id       = module.network.aks_subnet_id

  depends_on = [
    module.network
  ]
}

module "keyvault" {
  source = "./modules/keyvault"

  keyvault_name       = var.keyvault_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id

  depends_on = [
    module.resource_group
  ]
}

module "agent_vm" {
  source = "./modules/agent-vm"

  vm_name             = var.agent_vm_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.network.agent_subnet_id
  admin_username      = var.agent_admin_username
  admin_password      = var.agent_admin_password

  depends_on = [
    module.network
  ]
}