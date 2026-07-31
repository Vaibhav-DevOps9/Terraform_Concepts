data "azurerm_subnet" "data_snet" {
    for_each = var.bastion
  name                 = each.value.bastion_snet_name
  virtual_network_name = each.value.bastion_vnet_name
  resource_group_name  = each.value.bastion_rg_name
}

data "azurerm_public_ip" "data_pip" {
    for_each = var.bastion
  name                = each.value.bastion_pip_name
  resource_group_name = each.value.bastion_rg_name
}