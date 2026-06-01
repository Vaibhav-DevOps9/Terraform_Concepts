terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }
  #   backend "azurerm" {
  #     resource_group_name  = "rg1"
  #     storage_account_name = "stg126may2026"
  #     container_name       = "vhds"
  #     key                  = "mango.tfstate"
  #   }
}

provider "azurerm" {
  features {}
}