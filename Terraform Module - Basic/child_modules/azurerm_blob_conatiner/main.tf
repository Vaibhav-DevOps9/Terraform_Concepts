resource "azurerm_storage_container" "blob" {
    for_each = each.blob
    name = each.value.blob_name
    storage_account_id = azurerm_storage_account.stg_key.id
    container_access_type = each.value.access_type
  
}