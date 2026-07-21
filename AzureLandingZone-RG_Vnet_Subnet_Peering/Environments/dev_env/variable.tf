variable "main_rgs" {
  description = "Map of Resource Group to create"
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "main_vnet" {
  description = "Virtual Network created using Nested Map"
  type = map(object({
    vnet_name     = string
    address_space = list(string)
    rg_key        = string
  }))
}

