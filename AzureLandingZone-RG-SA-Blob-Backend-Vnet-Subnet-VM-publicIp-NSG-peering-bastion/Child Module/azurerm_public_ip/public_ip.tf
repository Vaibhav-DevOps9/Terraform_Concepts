resource "azurerm_public_ip" "public_ip" {
  for_each            = var.pip
  name                = each.value.pip_name
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
  location            = azurerm_virtual_network.vnet[each.value.vnet_key].location
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "lb_ip" {
  for_each = var.lb_pip
  name                = each.value.lb_pip_name    #"PublicIPForLB"
  location            = azurerm_virtual_network.vnet[each.value.vnet_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
  allocation_method   = "Static"
}


##############################################################################################

resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.nic_name
  location            = azurerm_virtual_network.vnet[each.value.vnet_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = azurerm_subnet.subnet[each.value.subnet_key].id
    private_ip_address_allocation = "Dynamic"
  }
}

#####################################################################################

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet
  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.rg[each.value.rg_key].name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes #["10.0.1.0/24"]
}

######################################################################################

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet
  name                = each.value.vnet_name
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
  location            = each.value.vnet_location
  address_space       = each.value.address_space
}


######################################################################################

resource "azurerm_storage_container" "blob1" {
  depends_on            = [azurerm_storage_account.stg]
  for_each              = var.blob
  name                  = each.value.blob_name
  storage_account_id    = azurerm_storage_account.stg[each.value.stg_key].id
  container_access_type = "private"
}

###############################################################################

resource "azurerm_storage_account" "stg" {
  for_each                 = var.stg
  name                     = each.value.stg_name
  resource_group_name      = azurerm_resource_group.rg[each.value.rg_key].name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

###################################################################################
resource "azurerm_resource_group" "rg" {
  for_each = var.rg
  name     = each.value.rg_name
  location = each.value.rg_location
}