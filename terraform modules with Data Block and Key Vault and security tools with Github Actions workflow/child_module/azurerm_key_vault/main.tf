resource "azurerm_key_vault" "key_vault" {
  for_each = var.key_vault

  name                       = each.value.key_vault_name
  location                   = each.value.location
  resource_group_name        = each.value.rg_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = each.value.soft_delete_retention_days
  purge_protection_enabled   = each.value.purge_protection_enabled
  sku_name                   = each.value.sku_name

  rbac_authorization_enabled = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set"
    ]
  }
}

resource "azurerm_key_vault_secret" "vm_username" {

  for_each = var.key_vault

  name         = "admin-username"
  value        = each.value.admin_username
  key_vault_id = azurerm_key_vault.key_vault[each.key].id
}


resource "azurerm_key_vault_secret" "vm_password" {

  for_each = var.key_vault

  name         = "admin-password"
  value        = each.value.admin_password
  key_vault_id = azurerm_key_vault.key_vault[each.key].id
}