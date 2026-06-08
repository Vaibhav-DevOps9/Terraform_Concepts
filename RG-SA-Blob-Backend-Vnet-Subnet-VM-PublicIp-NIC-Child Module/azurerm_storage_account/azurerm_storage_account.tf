resource "azurerm_storage_account" "stg" {
    for_each = var.stg
    name = each.value.name
    resource_group_name = each.value.rg_name
    location = each.value.location
    account_tier = each.value.tier
    account_replication_type = each.value.replication
}