variable "blob" {
    description = "Blob Container inside SA for tfstate"
    type = map(object({
        name = string
        container_access_type = string
        stg_key = string
    }))
  
}