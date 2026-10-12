variable "bastion_host" {
    description = "Azure Bastion Host"
    type = map(object({
        bastion_name = string
        rg_name = string
        location = string
        config_name = string
    }))
  
}