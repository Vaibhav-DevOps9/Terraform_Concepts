variable "virtual_network" {
    description = "Virtual Network created using Nested Map"
    type = map(object({
        vnet_name = string
        address_space = list(string)
        rg_key = string
    }))
}

variable "resource_group_name" {
    type = map(string)
}


variable "resource_group_location" {
    type = map(string)
}