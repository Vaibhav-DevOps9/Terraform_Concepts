variable "rg" {
    description = "Map of Resource Group to create"
    type = map(object({
        rg_name = string
        location = string
        managed_by = optional(string)
        tags = optional(map(string))
    }))
}