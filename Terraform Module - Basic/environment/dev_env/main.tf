module "resource_group" {
  source = "../../child_modules/azurerm_resource_group"
  rgs = {
    rg1 = {
      name       = "resource_group_dev_01_Canadacentral"
      location   = "Canadacentral"
      managed_by = "terraform1"
      

    }
  }

}

module "storage_account" {
  depends_on = [module.resource_group]
  source     = "../../child_modules/azurerm_storage_account"
  stg_acc = {
    stg1 = {
      name                     = "stgaccdev01canadacentral"
      resource_group_name      = "resource_group_dev_01_Canadacentral"
      location                 = "Canadacentral"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
}

# module "blob_container" {
#     depends_on = [ module.resource_group , module.storage_account ]
#     source = "../../child_modules/azurerm_blob_container"
# }

# module "virtual_network" {
#     depends_on = [ module.resource_group ]
#     source = "../../child_modules/azurerm_virtual_network"
# }

# module "subnet" {
#     depends_on = [ module.resource_group , module.virtual_network ]
#     source = "../../child_modules/azurerm_subnet"
# }

