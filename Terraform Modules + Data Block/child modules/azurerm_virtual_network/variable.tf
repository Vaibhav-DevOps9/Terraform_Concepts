variable "vnets" {
    description = "Virtual Network for the Landing Zone"
    type = map(object({
        vnet_name = string
        location = string
        rg_name = string
        address_space = list(string)
    }))
}