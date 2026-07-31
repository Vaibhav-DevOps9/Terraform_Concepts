variable "nic" {
    description = "Network Interface"
    type = map(object({
      nic_name = string
      location = string
      rg_name = string
      config_name = string
      private_ip_address_allocation = string
      nic_snet_name = string
      nic_vnet_name = string
      nic_rg_name = string
      nic_pip_name = string 
    }))
}