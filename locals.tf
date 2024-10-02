locals {
    azurerm_resource_group = ""
    azurerm_subscription_id = ""
    azurerm_tenant_id = ""
    azurerm_location = "Germany West Central"
    service_principal_id = ""
    service_principal_secret = ""
    storage_account = ""
    storage_container = ""
    vm {
        name
        image_os = 'linux'
        allow_extension_operations = false
        admin_ssh_keys {
            public_key = 
        }
        admin_username = ""    
        os_disk {
            caching = "ReadWrite"
            storage_account_type "Standard_LRS"
        }
        data_disk {
            name = "linuxdisk"
            storage_account_type = "Standard_LRS"
            create_option = "Empty"
            disk_size_gb = 50
            caching = "ReadWrite"
            disk_encryption_set_id = ""
        }
        network_interface {
            ip_forwarding_enabled = false
            ip_configurations {
                name = ""
                primary = true
            }
            Nic network security group = "none"
            Delete nic when vm is deleted = true
            Enable Accelerated networking = true
        }
        os {
            simple = "UbuntuServer"
            version = "20.04"
            updates = "ImageDefault"
        }
        size = 
        subnet_id = 
        user_data = file(./startup.sh) ## FIX. Create extract from script file and use 
        
    }
}
