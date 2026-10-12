resource "azurerm_storage_account" "stg" {
    for_each = var.stg
    name = each.value.stg_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    account_tier = each.value.account_tier
    account_replication_type = each.value.replication
  }