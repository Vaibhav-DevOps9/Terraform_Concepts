variable "bastion" {
    description = "Azure Bastion"
    type = map(object({
      bastion_name = string
      location = string
      rg_name = string
      bastion_config_name = string
    }))
  
}