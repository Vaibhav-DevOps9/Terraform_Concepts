variable "vnets" {
    description = "Virtual Network"
    type = map(object({
      vnet_name = string
      location = string
      rg_name = string
      address_space = list(string) 
    }))
  
}