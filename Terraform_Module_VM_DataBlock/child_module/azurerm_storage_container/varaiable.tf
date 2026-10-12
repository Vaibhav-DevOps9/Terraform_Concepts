variable "blob" {
    description = "Blob"
    type = map(object({
        blob_name = string
        access = string
    }))
  
}