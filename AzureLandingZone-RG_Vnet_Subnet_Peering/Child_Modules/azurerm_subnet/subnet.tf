resource "azurerm_subnet" "subnet" {
    for_each = var.snet
    name = each.value.subnet_name
    virtual_network_name = var.vnet[each.value.vnet_key]
    resource_group_name = var.resource_group_name[each.value.rg_key]
    address_prefixes = each.value.address_prefixes
}