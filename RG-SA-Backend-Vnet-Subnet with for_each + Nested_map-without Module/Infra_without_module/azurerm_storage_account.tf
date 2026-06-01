resource "azurerm_storage_account" "stg" {
  for_each                 = var.stg
  depends_on               = [azurerm_resource_group.rg]
  name                     = each.value.name
  resource_group_name      = each.value.rg
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}