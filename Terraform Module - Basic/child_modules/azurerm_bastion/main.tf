resource "azurerm_bastion_host" "bastion" {
    for_each = var.bastion
  name                = each.value.name    #"examplebastion"
  location            = each.value.location   #azurerm_resource_group.example.location
  resource_group_name = each.value.resource_group_name    #azurerm_resource_group.example.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.example.id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}