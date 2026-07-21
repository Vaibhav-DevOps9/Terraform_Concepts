output "vnet" {
  value = {
    for vnet_key, virtual_network in azurerm_virtual_network.vnet : vnet_key => virtual_network.name
  }
}
