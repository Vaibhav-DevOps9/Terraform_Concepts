resource "azurerm_bastion_host" "bastion" {
    for_each = var.bastion
  name                = each.value.bastion_name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name

  ip_configuration {
    name                 = each.value.bastion_ip_configuration
    subnet_id            = azurerm_subnet.subnet[each.value.subnet_key].id
    public_ip_address_id = azurerm_public_ip.pip[each.value.pip_key].id
  }
}
#############################################################################################
