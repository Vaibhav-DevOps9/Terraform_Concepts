variable "blob" {
    description = "BLOB container for State File"
    type = map(object({
        blob_name = string
        access = string
        data_stg = string
        data_rg_name = string
    }))
}