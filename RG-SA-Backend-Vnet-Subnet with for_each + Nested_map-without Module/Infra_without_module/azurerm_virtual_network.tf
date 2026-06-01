resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet
  depends_on          = [azurerm_resource_group.rg]
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.add_space #["10.0.0.0/16"]
}