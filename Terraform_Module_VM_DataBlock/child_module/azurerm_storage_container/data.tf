data "azurerm_storage_account" "data_stg" {
    for_each = var.blob
    name = each.value.data_stg_name
    resource_group_name = each.value.data_rg_name
  
}