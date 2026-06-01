variable "blob_container" {
    description = "Map of blob containers to create. The key is the name of the blob container and the value is an object with the properties 'name' and 'storage_account_id'."
    type = map(object({
        name               = string
    }))
}