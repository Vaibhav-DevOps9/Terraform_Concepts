resource "azurerm_storage_account" "stg" {
    for_each = var.stgs
    name = each.value.stg_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    account_replication_type = each.value.replication
    account_tier = each.value.tier
}