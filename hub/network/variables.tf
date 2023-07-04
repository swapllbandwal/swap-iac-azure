variable "rg-tg1" {
    type = map(string) 
    description = "tf rg description"

    default = {
        name = "tf-rg1"
        location = "EAST US"
    }
}


variable "tf-vnet1" {
    type = object({
      name = string
      address_space = list(string)
    })
    default = {
        name                = "tf-vnet1"
        address_space       = ["10.10.1.0/24","192.168.10.0/24"]
    }
    
}


variable "tf-hub-vmsubnet" {
    type = object({
      name = string
      address_space = list(string)
    })
    default = {
        name                = "tf-hub-vmsubnet"
        address_space       = ["10.10.1.0/26"]
    }  
}

variable "tf-hub-gwsubnet" {
    type = object({
      name = string
      address_space = list(string)
    })
    default = {
        name                = "GatewaySubnet"
        address_space       = ["10.10.1.64/26"]
    }  
}
variable "tf-hub-fwsubnet" {
    type = object({
      name = string
      address_space = list(string)
    })
    default = {
        name                = "AzureFirewallSubnet"
        address_space       = ["192.168.10.0/26"]
    }  
}

