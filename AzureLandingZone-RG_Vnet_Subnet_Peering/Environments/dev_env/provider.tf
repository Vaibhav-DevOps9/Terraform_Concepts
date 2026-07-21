terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.76.0"
    }
  }
  # backend "azurerm" {
  #     resource_group_name = "dev_eastus_rg"
  #     storage_account_name = "dev_gootgle_stg"
  #     container_name = "blob_container"
  #     key = "meta.tfsate"
  #     }
}

provider "azurerm" {
  features {}
}