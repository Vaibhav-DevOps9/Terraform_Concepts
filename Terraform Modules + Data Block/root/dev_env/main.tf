module "resource_group" {
  source = "../../child modules/azurerm_resource_group"
  rgs    = var.parent_rg
}

module "storage_account" {
  depends_on = [module.resource_group]
  source     = "../../child modules/azurerm_storage_account"
  stgs       = var.parent_stgs

}

module "storage_container" {
  depends_on = [module.resource_group, module.storage_account]
  source     = "../../child modules/azurerm_storage_container"
  blob       = var.parent_blob

}