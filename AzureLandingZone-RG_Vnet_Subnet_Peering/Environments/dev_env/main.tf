module "module_rg" {
  source = "../../Child_Modules/azurerm_resource_group"
  rg     = var.main_rgs

}

module "module_vnet" {
  source                  = "../../Child_Modules/azurerm_virtual_network"
  virtual_network         = var.main_vnet
  resource_group_name     = module.module_rg.resource_group_name
  resource_group_location = module.module_rg.resource_group_location

}

# module "subnet" {
#   source = "../../Child_Modules/azurerm_subnet"

# }