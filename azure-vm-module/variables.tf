variable "name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the virtual machine"
}

# ... other variables for image name, size, etc.

# Optional variables
variable "network_interface_name" {
  type        = string
  description = "Name of the network interface"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
}

# ... other optional variables