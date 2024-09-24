
output "private_ip_address" {
  value = "${terraform_module.azurerm_private_vms.private_ip_address}"
}

# ... other outputs as needed