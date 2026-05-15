resource "azurerm_storage_container" "blob-1" {
  depends_on            = [azurerm_resource_group.rg1, azurerm_storage_account.stg-1]
  name                  = "blob15may"
  storage_account_id    = azurerm_storage_account.stg-1.id
  container_access_type = "private"
}