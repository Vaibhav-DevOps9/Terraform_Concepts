resource "azurerm_bastion_host" "bastion" {
    for_each = var.bastion
    name = each.value.bastion_name
    location = each.value.location
    resource_group_name = each.value.rg_name

    ip_configuration {
      name = each.value.bastion_config_name
      subnet_id = data.azurerm_subnet.data_snet[each.key].id
      public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id
    }
  
}


