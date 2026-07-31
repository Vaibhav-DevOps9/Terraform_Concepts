resource "azurerm_storage_container" "blob" {
    for_each = var.blob
    name = each.value.blob_name
    storage_account_id = data.azurerm_storage_account.data_stg[each.key].id
    container_access_type = each.value.access
}


