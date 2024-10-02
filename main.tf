module "linux" {
  source = "Azure/virtual-machine/azurerm"
  version = "1.1.0"
  location                   = data.azurerm_resource_group.rg.location
  image_os                   = local.vm.image_os
  resource_group_name        = data.azurerm_resource_group.rg.name
  allow_extension_operations = local.vm.allow_extension_operations
  data_disks = [
    for i in range(2) : {
      name                 = "${local.data_disk.name}${random_id.id.hex}${i}"
      storage_account_type = local.data_disk.storage_account_type
      create_option        = local.data_disk.create_option
      disk_size_gb         = local.data_disk.disk_size_gb
      attach_setting = {
        lun     = i
        caching = local.data_disk.caching
      }
      disk_encryption_set_id = local.data_disk.disk_encryption_set_id
    }
  ]
  new_boot_diagnostics_storage_account = {
    customer_managed_key = {
      key_vault_key_id          = azurerm_key_vault_key.storage_account_key.id
      user_assigned_identity_id = azurerm_user_assigned_identity.storage_account_key_vault.id
    }
  }
  new_network_interface = {
    ip_forwarding_enabled = local.network_interface.ip_forwarding_enabled
    ip_configurations = [
      {
        name = local.network_interface.ip_configurations.name
        subnet_id = local.network_interface.ip_configurations.subnet_id
        primary              = true
      }
    ]
  }
  admin_username = "azureuser"
  admin_ssh_keys = [
    {
      public_key = local.vm.admin_ssh_keys.public_key
    }
  ]
  name = local.vm.name
  os_disk = {
    caching              = local.vm.os_disk.caching
    storage_account_type = local.vm.os_disk.storage_account_type
  }
  os_simple = local.vm.os.simple
  os_version = local.vm.os.version
  patch_assement_mode
  size      = local.vm.size
  subnet_id = local.vm.subnet_id

}