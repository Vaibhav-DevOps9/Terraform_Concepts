resource "azurerm_storage_account" "stg-1" {
  depends_on               = [azurerm_resource_group.rg-1]
  name                     = "stgvaibaj1"
  resource_group_name      = "rg-terraform-01"
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = "centralindia"
}