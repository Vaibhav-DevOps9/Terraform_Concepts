resource "azurerm_subnet" "subnet" {
    for_each = var.subnet
  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes                 #["10.0.1.0/24"]
}