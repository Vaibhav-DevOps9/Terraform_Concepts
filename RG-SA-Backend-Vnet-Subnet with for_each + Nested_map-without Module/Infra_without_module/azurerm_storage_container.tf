resource "azurerm_storage_container" "blob_container" {
  for_each              = var.blob_container
  depends_on            = [azurerm_storage_account.stg]
  name                  = each.value.name
  storage_account_id    = azurerm_storage_account.stg[each.value.storage_account_key].id
  container_access_type = "private"
}