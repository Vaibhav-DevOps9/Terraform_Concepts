variable "stg" {
    description = "Storage Account"
    type = map(object({
      stg_name = string
      location = string
      rg_name = string
      account_tier = string
      replication = string
    }))
}