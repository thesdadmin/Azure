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
  name                 = local.ds_sn01.name
  virtual_network_name = local.ds_sn01.vpc_name
  resource_group_name  = data.azurerm_resource_group.name
}

data "azurerm_subnet" "sn02" {
  name                 = local.ds_sn02.name
  virtual_network_name = local.ds_sn02.name
  resource_group_name  = data.azurerm_resource_group.name
}

