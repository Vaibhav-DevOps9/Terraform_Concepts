data "azurerm_network_interface" "data_nic" {
    for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}


data "azurerm_key_vault" "data_kv" {
  for_each = var.vms
  name                = each.value.key_vault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "admin_username" {
  for_each = var.vms
  name         = "admin-username"
  key_vault_id = data.azurerm_key_vault.data_kv[each.key].id
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each = var.vms
  name         = "admin-password"
  key_vault_id = data.azurerm_key_vault.data_kv[each.key].id
}

