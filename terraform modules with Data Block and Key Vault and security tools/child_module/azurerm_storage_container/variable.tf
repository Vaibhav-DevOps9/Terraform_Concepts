variable "blob" {
  description = "Blob_container for State File"
  type = map(object({
    blob_name     = string
    access_type   = string
    data_stg_name = string
    data_rg_name  = string
  }))

}