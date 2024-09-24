# Configure module name and version
resource "terraform_module" "azurerm_private_vms" {
  source = "azurerm/virtual-machine"
  version = "~> 3.0.0" # Adjust version as needed

  # Pass required parameters
  name = "my-private-vm"
  resource_group_name = "my-resource-group"
  location = "eastus"
  image_name = "microsoft-windows-server-datacenter-core-gen2:latest"
  size = "Standard_D2_v2"
  admin_username = "myadminuser"
  admin_password = "myadminpassword" # Replace with a secure password or use a key pair

  # Optional parameters (adjust as needed)
  network_interface_name = "my-network-interface"
  subnet_id = "subnet_id"
  public_ip_address_id = null # Set to null for private VMs
  availability_set_name = null # Set to null if not using availability sets
  os_disk_size_gb = 50
  data_disk_size_gb = 100
  tags = {
    "environment" = "production"
  }
}