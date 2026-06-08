vm = {
    vm1 = {
        vm_name        = "myvm1"
        vm_location    = "eastus"
        publisher      = "Canonical"
        offer          = "0001-com-ubuntu-server-jammy"
        sku            = "22_04-lts"
        os_disk_name   = "myosdisk1"
        create_option  = "FromImage"
        comp_name      = "hostname"
        admin_username = "testadmin"
        password       = "Password1234!"
    }
    vm2 = {
        vm_name        = "myvm2"
        vm_location    = "eastus"
        publisher      = "MicrosoftWindowsServer"
        offer          = "WindowsServer"
        sku            = "2022-datacenter-azure-edition"
        os_disk_name   = "myosdisk2"
        create_option  = "FromImage"
        comp_name      = "hostname2"
        admin_username = "testadmin"
        password       = "Password1234!"
    }
}