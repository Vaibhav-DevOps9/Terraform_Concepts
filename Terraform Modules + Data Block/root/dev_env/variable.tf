variable "parent_rg" {
  description = "Resource Group for the Landing Zone Networking"
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = string
    tags       = map(string)

  }))
}

variable "parent_stgs" {
  description = "Storage Account created for State File managemnet"
  type = map(object({
    stg_name    = string
    location    = string
    rg_name     = string
    replication = string
    tier        = string

  }))
}

variable "parent_blob" {
  description = "BLOB container for State File"
  type = map(object({
    blob_name    = string
    access       = string
    data_stg     = string
    data_rg_name = string
  }))
}