variable "subnet" {
    type = map (object({
        name = string
        rg_name = string
        vnet_name = string
        add_prefixes = list (string)
    }))
}