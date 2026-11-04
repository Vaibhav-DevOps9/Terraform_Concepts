module "resource_group" {
  source = "../../child_module/azurerm_resource_group"
  rgs    = var.rgs
}

module "storage_account" {
  source     = "../../child_module/azurerm_storage_account"
  stgs       = var.stgs
  depends_on = [module.resource_group]
}

module "storage_blob_container" {
  source     = "../../child_module/azurerm_storage_container"
  blob       = var.blob
  depends_on = [module.storage_account, module.resource_group]
}

module "virtual_network" {
  source     = "../../child_module/azurerm_virtual_network"
  vnets      = var.vnets
  depends_on = [module.resource_group]
}

module "subnet" {
  source     = "../../child_module/azurerm_subnet"
  snets      = var.snets
  depends_on = [module.virtual_network, module.resource_group]
}

module "public_ip" {
  source     = "../../child_module/azurerm_public_ip"
  pip        = var.public_ip
  depends_on = [module.resource_group]
}

module "bastion_host" {
  source     = "../../child_module/azurerm_bastion_host"
  bastion    = var.bastion
  depends_on = [module.subnet, module.resource_group, module.virtual_network, module.public_ip]
}

module "network_interface" {
  source     = "../../child_module/azurerm_network_interface"
  nic        = var.nics
  depends_on = [module.subnet, module.resource_group, module.virtual_network]
}

module "network_security_group" {
  source     = "../../child_module/azurerm_network_security_group"
  nsgs       = var.nsgs
  depends_on = [module.resource_group]
}

module "nsg_subnet_association" {
  source                 = "../../child_module/azurerm_nsg_subnet_association"
  nsg_subnet_association = var.nsg_subnet_association
  depends_on             = [module.network_security_group, module.subnet, module.resource_group]
}

data "azurerm_client_config" "current" {}

module "key_vault" {
  source = "../../child_module/azurerm_key_vault"

  key_vault = {
    for kv_key, kv in var.key_vault : kv_key => merge(kv, {
      tenant_id = data.azurerm_client_config.current.tenant_id
    })
  }

  depends_on = [module.resource_group]
}

module "virtual_machine" {
  source     = "../../child_module/azurerm_linux_virtual_machine"
  vms        = var.vms
  depends_on = [module.network_interface, module.resource_group, module.key_vault]

}

module "load_balancer" {
  source         = "../../child_module/azurerm_load_balancer"
  load_balancers = var.load_balancers
  depends_on     = [module.resource_group, module.public_ip]
}
