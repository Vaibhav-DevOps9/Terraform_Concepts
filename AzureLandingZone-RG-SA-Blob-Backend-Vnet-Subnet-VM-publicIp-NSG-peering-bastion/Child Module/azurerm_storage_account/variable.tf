variable "stg" {
  description = "Storage_account"
  type = map(object({
    stg_name                 = string
    rg_key                   = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

#######################################################

variable "rg" {
  description = "Resource Group"
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}