
provider "azurerm" {
  features {}
}


terraform {
  
  backend "azurerm" {
    resource_group_name  = "iac-terraform-mgmt"
    storage_account_name = "iacterraformstatefiles"
    container_name       = "hub-virtualmachines"
    key                  = "virtualmachines.tfstate"
    
  }
}

