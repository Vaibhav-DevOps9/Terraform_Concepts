resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg
  name                = each.value.nsg_name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name

  security_rule {
    name                       = each.value.security_rule_name
    priority                   = 100 
    direction                  = each.value.direction  #"Inbound"
    access                     = each.value.access #"Allow"
    protocol                   = each.value.protocol  #"Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

########################################################################################
