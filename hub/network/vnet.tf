
resource "azurerm_resource_group" "tf-rg1" {
  name     = var.rg-tg1["name"]
  location = var.rg-tg1["location"]
}


resource "azurerm_virtual_network" "tf-vnet1" {
  name                = var.tf-vnet1["name"]
  address_space       = var.tf-vnet1["address_space"]
  location            = azurerm_resource_group.tf-rg1.location
  resource_group_name = azurerm_resource_group.tf-rg1.name
}


resource "azurerm_subnet" "tf-hub-vmsubnet" {
  name                 = var.tf-hub-vmsubnet.name
  address_prefixes     = var.tf-hub-vmsubnet.address_space
  resource_group_name  = azurerm_resource_group.tf-rg1.name
  virtual_network_name = azurerm_virtual_network.tf-vnet1.name
  
}
resource "azurerm_subnet" "tf-hub-gwsubnet" {
  name                 = var.tf-hub-gwsubnet.name
  address_prefixes     = var.tf-hub-gwsubnet.address_space
  resource_group_name  = azurerm_resource_group.tf-rg1.name
  virtual_network_name = azurerm_virtual_network.tf-vnet1.name
  
}
resource "azurerm_subnet" "tf-hub-fwsubnet" {
  name                 = var.tf-hub-fwsubnet.name
  address_prefixes     = var.tf-hub-fwsubnet.address_space
  resource_group_name  = azurerm_resource_group.tf-rg1.name
  virtual_network_name = azurerm_virtual_network.tf-vnet1.name
  
}
