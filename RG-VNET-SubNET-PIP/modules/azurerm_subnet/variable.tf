variable "rg_name" {
    description = "Name of the Resource Group"
    type = string
}
variable "virtual_network_name" {
    description = "Name of the Virtual Network"
    type = string
}
variable "subnet_name" {
    description = "Name of the Subnet"
    type = string
}
variable "subnet_address_prefix" {
    description = "Address prefix for the Subnet"
    type = list(string)
}
