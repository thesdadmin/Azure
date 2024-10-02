terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
   backend "azurerm" {
      resource_group_name  = local.azurerm_resource_group
      storage_account_name = local.storage_account
      container_name       = local.storage_container
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id   = local.azurerm_subscription_id
  tenant_id         = local.azurerm_tenant_id
  client_id         = local.service_principal_id
  client_secret     = local.service_principal_secret
}
