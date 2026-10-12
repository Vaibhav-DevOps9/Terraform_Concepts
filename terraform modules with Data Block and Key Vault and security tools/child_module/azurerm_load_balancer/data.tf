data "azurerm_public_ip" "data_pip" {
  for_each            = var.load_balancers
  name                = each.value.public_ip_name
  resource_group_name = each.value.rg_name
}