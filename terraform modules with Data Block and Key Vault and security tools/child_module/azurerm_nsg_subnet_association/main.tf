resource "azurerm_subnet_network_security_group_association" "nsg_subnet_association" {
  for_each                  = var.nsg_subnet_association
  subnet_id                 = data.azurerm_subnet.data_subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.data_nsg[each.key].id
}