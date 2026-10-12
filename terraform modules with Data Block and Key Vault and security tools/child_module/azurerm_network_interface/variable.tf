variable "nic" {
  description = "Network Interface"
  type = map(object({
    nic_name                      = string
    location                      = string
    rg_name                       = string
    ip_config_name                = string
    private_ip_address_allocation = string
    data_subnet_name              = string
    data_vnet_name                = string
    data_rg_name                  = string

  }))

}