module "resource_group" {
  source = "../../child_modules/azurerm_resource_group"
  rgs    = var.parent_resource_group
}

module "storage_account" {
  depends_on = [module.resource_group]
  source     = "../../child_modules/azurerm_storage_account"
  stg_acc    = var.parent_storage_account
}

# module "blob_container" {
#     depends_on = [ module.resource_group , module.storage_account ]
#     source = "../../child_modules/azurerm_blob_container"
# }

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../child_modules/azurerm_virtual_network"
  vnets      = var.parent_virtual_network
}

module "subnet" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../child_modules/azurerm_subnet"
  snet       = var.parent_subnet
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../child_modules/azurerm_public_ip"
  pip        = var.parent_pip


}

