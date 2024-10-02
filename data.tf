data "azurerm_resource_group" "rg" {
  name = local.azurerm_resource_group
}

data "azurerm_subscription" "sub" {
    subscription_id = local.azurerm_subscription_id
}

data "azure_rm_location" "region" {
    location = "Germany West"
}

data "azurerm_subnet" "sn01" {
  name                 = local.subnet.name
  virtual_network_name = local.subnet.vpc.name
  resource_group_name  = data.azurerm_resource_group.name
}

output "id" {
  value = data.azurerm_resource_group.example.id
}