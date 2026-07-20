variable "snet" {
    description = "Subnet for the VM"
    type = map(object({
        snet_name = string
        resource_group_name = string
        virtual_network_name = string
        address_prefixes = list(string)
    }))
}