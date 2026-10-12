variable "vnets" {
  description = "Virtual Network for Azure Landing Zone"
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
  }))

}