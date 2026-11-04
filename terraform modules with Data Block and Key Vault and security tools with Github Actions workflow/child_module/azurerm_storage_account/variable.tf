variable "stgs" {
  description = "Storage Account created"
  type = map(object({
    stg_name                 = string
    rg_name                  = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}