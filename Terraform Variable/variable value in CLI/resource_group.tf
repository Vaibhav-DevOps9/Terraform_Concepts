variable "x" {}
variable "y" {}

# resource "azurerm_resource_group" "rg-1" {
#   name     = "rg-1"
#   location = "West US"
# }

resource "azurerm_resource_group" "rg-2" {
  name     = var.x
  location = "West US"
}

resource "azurerm_resource_group" "rg-3" {
  name     = var.y
  location = "West US"
}

# resource "azurerm_storage_account" "storage-1" {
#   name                     = "s1t2o3r4a5g6e7"
#   resource_group_name      = azurerm_resource_group.rg-1.name     # Implicit dependency on resource group
#   location                 = azurerm_resource_group.rg-1.location # Implicit dependency on resource group
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

# }