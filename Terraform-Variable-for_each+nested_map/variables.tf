variable "abc" {
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
  description = "Name of the Resource_Group"
}

variable "stg" {
  type = map(object({
    stg_name        = string
    stg_replication = string
    stg_tier        = string
    rg_key          = string
  }))
  description = "Name of the Storage Account"
}

variable "containers" {
  type = map(object({
    container_name = string
    stg_key        = string
  }))
  description = "Name of the Blob Container"
}
