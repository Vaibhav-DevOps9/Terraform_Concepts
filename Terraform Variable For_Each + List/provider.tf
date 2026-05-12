terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-01"
    storage_account_name = "stgvaibaj1"
    container_name       = "blobcontainer01"
    key                  = "alphadev.tfstate"
  }
}

provider "azurerm" {
  features {}
}

