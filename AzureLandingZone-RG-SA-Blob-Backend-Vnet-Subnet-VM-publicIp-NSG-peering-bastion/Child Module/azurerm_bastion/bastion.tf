resource "azurerm_bastion_host" "bastion" {
    for_each = var.bastion
  name                = each.value.bastion_name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name

  ip_configuration {
    name                 = each.value.bastion_ip_configuration
    subnet_id            = azurerm_subnet.subnet[each.value.subnet_key].id
    public_ip_address_id = azurerm_public_ip.pip[each.value.pip_key].id
  }
}
#############################################################################################

resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg
  name                = each.value.nsg_name
  location            = azurerm_resource_group.rg[each.value.rg_key].location
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name

  security_rule {
    name                       = each.value.security_rule_name
    priority                   = 100 
    direction                  = each.value.direction  #"Inbound"
    access                     = each.value.access #"Allow"
    protocol                   = each.value.protocol  #"Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

########################################################################################

resource "azurerm_virtual_machine" "vm" {
  for_each              = var.vm
  name                  = each.value.vm_name
  location              = azurerm_virtual_network.vnet[each.value.vnet_key].location
  resource_group_name   = azurerm_resource_group.rg[each.value.rg_key].name
  network_interface_ids = [azurerm_network_interface.nic[each.value.nic_key].id]
  vm_size               = each.value.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = each.value.os_disk_termination #true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = each.value.data_disk_termination #true

  storage_image_reference {
    publisher = each.value.publisher #"Canonical"
    offer     = each.value.offer     #"0001-com-ubuntu-server-jammy"
    sku       = each.value.sku       #"22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = each.value.os_disk_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = each.value.computer_name  #"hostname"
    admin_username = each.value.admin_username #"testadmin"
    admin_password = each.value.admin_password #"Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = each.value.os_profile_linux_config #false
  }
}

####################################################################################################

resource "azurerm_public_ip" "public_ip" {
  for_each            = var.pip
  name                = each.value.pip_name
  resource_group_name = azurerm_resource_group.rg[each.value.rg_key].name
  location            = azurerm_virtual_network.vnet[each.value.vnet_key].location
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