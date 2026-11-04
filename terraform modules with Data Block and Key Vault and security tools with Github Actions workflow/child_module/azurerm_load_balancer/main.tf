resource "azurerm_lb" "lb" {
  for_each            = var.load_balancers
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_config_name
    public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id
  }
}