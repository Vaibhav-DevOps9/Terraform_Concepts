resource "azurerm_storage_container" "blob_container" {
    for_each = var.blob_container
  name                  = each.value.name
  storage_account_id    = "/"
  container_access_type = "private"
}