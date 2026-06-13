resource "azurerm_storage_account" "stg" {
  for_each                 = var.stg
  name                     = each.value.stg_name
  resource_group_name      = azurerm_resource_group.rg[each.value.rg_key].name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

###################################################################################
resource "azurerm_resource_group" "rg" {
  for_each = var.rg
  name     = each.value.rg_name
  location = each.value.rg_location
}