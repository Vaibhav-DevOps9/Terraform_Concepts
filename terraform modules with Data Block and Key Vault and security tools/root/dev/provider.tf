terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.6.0"
    }
  }
  #   backend "azurerm" {
  #     resource_group_name  = "tfstate-rg"
  #     storage_account_name = "stgtfstate"
  #     container_name       = "blob"
  #     key                  = "terraform.tfstate"
  #   }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}