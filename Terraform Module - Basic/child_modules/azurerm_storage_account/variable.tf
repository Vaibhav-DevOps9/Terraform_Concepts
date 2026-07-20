variable "stg_acc" {
    description = "Storage Account created"
    type = map (object({
        name = string
        resource_group_name = string
        location = string
        account_tier = string
        account_replication_type = string
    }))
  
}