output "tf-rg1_id" {
    value = azurerm_resource_group.tf-rg1.id  
}

output "rg-location" {
    value = azurerm_resource_group.tf-rg1.location
  
}

output "rg-name" {
    value = azurerm_resource_group.tf-rg1.name
  
}


output "hub-vmsubnetid" {
    value = azurerm_subnet.tf-hub-vmsubnet.id
  
}