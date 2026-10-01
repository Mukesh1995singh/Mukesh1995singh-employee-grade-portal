resource "azurerm_public_ip" "agent" {
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "agent" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.agent.id
  }
}

resource "azurerm_linux_virtual_machine" "agent" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name

  size = "Standard_D2as_v5"

  admin_username = var.admin_username
  admin_password = var.admin_password

  custom_data = filebase64("${path.module}/cloud-init.yaml")

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.agent.id
  ]

  priority        = "Spot"
  eviction_policy = "Deallocate"
  max_bid_price   = -1

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  tags = {
    role        = "azure-devops-self-hosted-agent"
    environment = "lab"
  }
}
