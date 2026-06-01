variable "rg" {
  description = "Map of resource groups to create. The key is the name of the resource group and the value is an object with the properties 'name' and 'location'."
  type = map(object({
    name     = string
    location = string
  }))
}

variable "stg" {
  description = "Map of storage accounts to create. The key is the name of the storage account and the value is an object with the properties 'name', 'rg', 'location', 'account_tier', and 'account_replication_type'."
  type = map(object({
    name                     = string
    rg                       = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "blob_container" {
  description = "Map of blob containers to create. The key is the name of the blob container and the value is an object with the properties 'name' and 'storage_account_id'."
  type = map(object({
    name                = string
    storage_account_key = string
  }))
}

variable "vnet" {
  description = "Map of virtual networks to create. The key is the name of the virtual network and the value is an object with the properties 'name', 'location', 'rg_name', and 'add_space'."
  type = map(object({
    name      = string
    location  = string
    rg_name   = string
    add_space = list(string)
  }))
}

variable "subnet" {
  type = map(object({
    name         = string
    rg_name      = string
    vnet_name    = string
    add_prefixes = list(string)
  }))
}