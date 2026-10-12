data "azurerm_subnet" "data_subnet" {
  for_each             = var.nic
  name                 = each.value.data_subnet_name
  virtual_network_name = each.value.data_vnet_name
  resource_group_name  = each.value.data_rg_name
}