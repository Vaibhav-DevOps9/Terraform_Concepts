resource "azurerm_storage_container" "example" {
  for_each = var.containers
  name                  = each.value.container_name
  storage_account_id    = azurerm_storage_account.stg[each.value.stg_key].id
  container_access_type = "private"
}