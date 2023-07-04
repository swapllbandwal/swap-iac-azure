data "terraform_remote_state" "hub-network" {
    backend = "azurerm"
    config = {
        resource_group_name  = "iac-terraform-mgmt"
        storage_account_name = "iacterraformstatefiles"
        container_name       = "hub-network"
        key                  = "vnet.tfstate"
    }
}

 