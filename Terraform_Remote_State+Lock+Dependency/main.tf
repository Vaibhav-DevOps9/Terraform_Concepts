terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
  backend "azurerm" {
    # use_cli              = true                                   
    # use_azuread_auth     = true                                   
    # tenant_id            = "cc4af8a9-25a2-4ed4-8f44-572f2caa77e0"
    resource_group_name = "rg-1" 
    storage_account_name = "s1t2o3r4a5g6e7"                       
    container_name       = "blob-container"                       
    key                  = "basic.terraform.tfstate"              
  }
}

provider "azurerm" {
  features {}
  #subscription_id = "xxxxxxxxxxxx"
}

resource "azurerm_resource_group" "rg-1" {
  name     = "rg-1"
  location = "West US"
}


resource "azurerm_storage_account" "storage-1" {
  name                     = "s1t2o3r4a5g6e7"
  resource_group_name      = azurerm_resource_group.rg-1.name     # Implicit dependency on resource group
  location                 = azurerm_resource_group.rg-1.location # Implicit dependency on resource group
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_container" "example" {
  name                  = "blob-container"
  storage_account_id    = "/subscriptions/eadc08c2-3cf9-40a1-ba9a-9d10b75902ed/resourceGroups/rg-1/providers/Microsoft.Storage/storageAccounts/s1t2o3r4a5g6e7"
  container_access_type = "private"
}