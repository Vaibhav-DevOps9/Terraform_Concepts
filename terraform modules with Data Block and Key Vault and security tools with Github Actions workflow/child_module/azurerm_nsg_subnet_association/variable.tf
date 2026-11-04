variable "nsg_subnet_association" {
  description = "Network Security Group Subnet Association"
  type = map(object({
    subnet_name          = string
    virtual_network_name = string
    resource_group_name  = string
    nsg_name             = string
  }))

}