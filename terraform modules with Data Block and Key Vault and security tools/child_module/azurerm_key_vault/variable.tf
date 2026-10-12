variable "key_vault" {
  description = "Key Vault configuration"

  type = map(object({
    key_vault_name = string
    location       = string
    rg_name        = string
    tenant_id      = string
    soft_delete_retention_days = number
    purge_protection_enabled    = bool
    sku_name = string
    admin_username = string
    admin_password = string
  }))

  #sensitive = true
}