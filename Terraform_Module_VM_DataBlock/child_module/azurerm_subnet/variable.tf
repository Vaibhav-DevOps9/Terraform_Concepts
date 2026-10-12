variable "snets" {
    description = "Subnet"
    type = map(object({
        snet_name = string
        vnet_name = string
        rg_name = string
        address_prefixes = list(string)
    }))
  
}