resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet
  name                = each.value.vnet_name
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
  location            = each.value.vnet_location
  address_space       = each.value.address_space
}


######################################################################################

resource "azurerm_storage_container" "blob1" {
  depends_on            = [azurerm_storage_account.stg]
  for_each              = var.blob
  name                  = each.value.blob_name
  storage_account_id    = azurerm_storage_account.stg[each.value.stg_key].id
  container_access_type = "private"
}

###############################################################################

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