variable "stgs" {
    description = "Storage Account created for State File managemnet"
    type = map(object({
        stg_name = string
        location = string
        rg_name = string
        replication = string
        tier = string

    }))
}