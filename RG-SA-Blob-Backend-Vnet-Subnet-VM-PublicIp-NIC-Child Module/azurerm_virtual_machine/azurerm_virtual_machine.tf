resource "azurerm_virtual_machine" "main" {
    for_each = var.vm
  name                  = each.value.vm_name
  location              = each.value.vm_location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
   delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
   delete_data_disks_on_termination = true

    storage_image_reference {
    publisher = each.value.publisher #"Canonical"
    offer     = each.value.offer #"0001-com-ubuntu-server-jammy"
    sku       = each.value.sku #"22_04-lts" #Product ID
    version   = "latest"
  }
  storage_os_disk {
    name              =   each.value.os_disk_name #myosdisk1
    caching           = "ReadWrite"
    create_option     =  each.value.create_option  #"FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  =   each.value.comp_name #"hostname"
    admin_username =   each.value.admin_username #"testadmin"
    admin_password =   each.value.password #"Password1234!"
  }
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
#   tags = {
#     environment = "staging"
#   }
}