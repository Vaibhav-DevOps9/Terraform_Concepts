variable "bastion" {
  description = "Azurer Bastion"
  type = map(object({
    bastion_name     = string
    location         = string
    rg_name          = string
    ip_config_name   = string
    data_subnet_name = string
    data_vnet_name   = string
    data_pip_name    = string
  }))

}