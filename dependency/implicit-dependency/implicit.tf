terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "eadc08c2-3cf9-40a1-ba9a-9d10b75902ed"
}

resource "azurerm_resource_group" "rg1" {
  name     = "rg-implicit-dependency1"
  location = "eastus"
}

resource "azurerm_resource_group" "rg2" {
  name     = "rg-implicit-dependency2"
  location = "eastus"
}

resource "azurerm_storage_account" "sa1" {
  name                     = "stgimplicitdependency1"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "sa2" {
  name                     = "stgimplicitdependency2"
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = azurerm_resource_group.rg2.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
