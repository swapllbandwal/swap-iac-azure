
resource "azurerm_network_interface" "vm_nic" {
    for_each = var.vm_map

    name                = "${each.value.name}-nic"
    location            = data.terraform_remote_state.hub-network.outputs.rg-location
    resource_group_name = data.terraform_remote_state.hub-network.outputs.rg-name

    ip_configuration {
        name                          = var.vm_nic.ip_configuration.name
        private_ip_address_allocation = var.vm_nic.ip_configuration.private_ip_address_allocation
        subnet_id                     = data.terraform_remote_state.hub-network.outputs.hub-vmsubnetid
    }
}


resource "azurerm_windows_virtual_machine" "tf-hub-win-" {
    for_each = var.vm_map
    name                = each.value.name
    resource_group_name = data.terraform_remote_state.hub-network.outputs.rg-name
    location            = data.terraform_remote_state.hub-network.outputs.rg-location
    size = each.value.size
    admin_username      = "swapadmin"
    admin_password      = each.value.admin_password
    network_interface_ids = [azurerm_network_interface.vm_nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}



//old logic of VM creation
/*
resource "azurerm_network_interface" "tf-hubvm-nic1" {
  name                = var.tf-hubvm-nic1.name
  location            = data.terraform_remote_state.hub-network.outputs.rg-location
  resource_group_name = data.terraform_remote_state.hub-network.outputs.rg-name

  ip_configuration {
    name                          = var.tf-hubvm-nic1.ip_configuration.name
    private_ip_address_allocation = var.tf-hubvm-nic1.ip_configuration.private_ip_address_allocation
    subnet_id                     = data.terraform_remote_state.hub-network.outputs.hub-vmsubnetid
  }
}


resource "azurerm_windows_virtual_machine" "tf-hub-win-vm1" {
  name                = "tf-hub-win-vm1"
  resource_group_name = data.terraform_remote_state.hub-network.outputs.rg-name
  location            = data.terraform_remote_state.hub-network.outputs.rg-location
  size = "Standard_B1s"
  admin_username      = "swapadmin"
  admin_password      = "P@ssw0rd@123"
  network_interface_ids = [
    azurerm_network_interface.tf-hubvm-nic1.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

*/