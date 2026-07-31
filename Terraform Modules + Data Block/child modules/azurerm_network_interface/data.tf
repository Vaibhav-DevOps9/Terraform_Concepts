data "azurerm_subnet" "data_snet" {
    for_each = var.nic
  name                 = each.value.nic_snet_name
  virtual_network_name = each.value.nic_vnet_name
  resource_group_name  = each.value.nic_rg_name
}

data "azurerm_public_ip" "data_pip" {
    for_each = var.nic
  name                = each.value.nic_pip_name
  resource_group_name = each.value.nic_rg_name
}