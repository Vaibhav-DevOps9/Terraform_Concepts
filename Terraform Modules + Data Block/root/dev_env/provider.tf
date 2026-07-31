terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }
    backend "azurerm" {
      resource_group_name = "rg-kiro"
      storage_account_name = "stgkiro"
      container_name = "blob-kiro"
      key = "dev.tfstate"
   }
}

provider "azurerm" {
  features {}

}