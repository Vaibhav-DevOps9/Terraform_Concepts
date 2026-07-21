variable "snet" {
    description = "Subnet created in the VNet"
    type = map(object({
        subnet_name = string
        vnet_key = string
        rg_key = string
        address_prefixes = list(string)
    }))
}

variable "resource_group_name" {
    type = map(string)
}


variable "vnet" {
    type = map(string)
}