terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_network_security_group" "test" {
  name                = "test-nsg"
  location            = "Central India"
  resource_group_name = "test-rg"

  security_rule {
    name                       = "Allow-SSH-From-Internet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix     = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_storage_account" "test" {
  name                     = "myteststorage123456"
  resource_group_name      = "test-rg"
  location                 = "Central India"
  account_tier              = "Standard"
  account_replication_type = "LRS"

  min_tls_version = "TLS1_0"

  https_traffic_only_enabled = false
}