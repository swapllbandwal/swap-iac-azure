variable "vm_map" {
    type = map(object({
        name = string
        size = string
        admin_password = string

    }))
  
    default = {
      "vm1" = {
        name = "swap-vm4"
        size = "Standard_B1s"
        admin_password = "P@ssw0rd@123"    
      }
      "vm2 " = {
        name = "swap-vm5"
        size = "Standard_B1s"
        admin_password = "P@ssw0rd@123"    
      }
      "vm3" = {
        name = "swap-vm3"
        size = "Standard_D2s_v3"
        admin_password = "P@ssw0rd@123"    
      }
    }

    
  
}



variable "vm_nic"{
    type = object({
      name = string
      ip_configuration = map(string)
    })

    default = {
        name = "ipconfig"
        ip_configuration = {
            name    = "ipconfig"
            private_ip_address_allocation = "Dynamic"
        }
    }
}

