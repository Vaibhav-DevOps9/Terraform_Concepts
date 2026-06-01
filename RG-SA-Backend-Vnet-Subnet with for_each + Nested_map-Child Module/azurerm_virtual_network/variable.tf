variable "vnet" {
  description = "Map of virtual networks to create. The key is the name of the virtual network and the value is an object with the properties 'name', 'location', 'rg_name', and 'add_space'."
  type        = map(object({
    name     = string
    location = string
    rg_name  = string
    add_space = list(string)
  }))
}