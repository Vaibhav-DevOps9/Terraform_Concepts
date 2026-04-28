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
    key                  = "variable.state.terraform.tfstate"              
  }
}

provider "azurerm" {
  features {}
  #subscription_id = "xxxxxxxxxxxx"
}