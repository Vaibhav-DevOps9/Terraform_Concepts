variable "bastion" {
    description = "Bastion Host for Vnet"
    type = map(object({
        bastion_name = string
        rg_key = string
        bastion_ip_configuration = string
        subnet_key = string
        pip_key = string
    }))
}

#########################################################################
