output "resource_group_name" {
  value = {
    for rg_key, rg in azurerm_resource_group.res_group : rg_key => rg.name
  }
}

output "resource_group_location" {
  value = {
    for rg_key, rg in azurerm_resource_group.res_group : rg_key => rg.location
  }
}