resource "azurerm_bastion_host" "bastion" {
    for_each = var.bastion_host
    name = each.value.bastion_name
    resource_group_name = each.value.rg_name
    location = each.value.location

    ip_configuration {
      name = each.value.config_name
      subnet_id = 
      public_ip_address_id = 
    }
  
}