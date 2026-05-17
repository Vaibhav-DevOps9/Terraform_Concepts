terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }
  backend "azurerm" {
      resource_group_name = "rg-sweety"
      storage_account_name = "bantastorage17may"
      container_name = "my-container"
      key = "nestedmap.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

