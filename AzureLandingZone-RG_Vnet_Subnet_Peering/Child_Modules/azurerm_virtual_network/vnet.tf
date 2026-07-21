resource "azurerm_virtual_network" "vnet" {
    for_each = var.virtual_network
  name                = each.value.vnet_name
  location            = var.resource_group_location[each.value.rg_key]
  resource_group_name = var.resource_group_name[each.value.rg_key]
  address_space       = each.value.address_space  #["10.0.0.0/16"]
 # dns_servers         = ["10.0.0.4", "10.0.0.5"]
}