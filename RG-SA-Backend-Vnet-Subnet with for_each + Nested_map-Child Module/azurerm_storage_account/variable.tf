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
