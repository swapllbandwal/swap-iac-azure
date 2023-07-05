variable "vm_map" {
    type = map(object({
        name = string
        size = string
        admin_password = string

    }))
  
    default = {
      "dev-vm1" = {
        name = "dev-vm1"
        size = "Standard_B1s"
        admin_password = "P@ssw0rd@123"    
      }
      "dev-vm2 " = {
        name = "dev-vm2"
        size = "Standard_B1s"
        admin_password = "P@ssw0rd@123"    
      }
      "dev-vm3" = {
        name = "dev-vm3"
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

