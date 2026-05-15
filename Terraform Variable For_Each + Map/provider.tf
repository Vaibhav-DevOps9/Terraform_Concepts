terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }
  backend "azurerm" {
      resource_group_name = "rg15may"
      storage_account_name = "stg15may"
      container_name = "blob15may"
      key = "terraform15may.tfstate"
  }
}

provider "azurerm" {
  features {}
}

