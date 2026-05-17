resource "azurerm_storage_account" "stg" {
  for_each                 = var.stg
  name                     = each.value.stg_name
  resource_group_name      = azurerm_resource_group.rg[each.value.rg_key].name
  location                 = azurerm_resource_group.rg[each.value.rg_key].location
  account_replication_type = each.value.stg_replication
  account_tier             = each.value.stg_tier
}