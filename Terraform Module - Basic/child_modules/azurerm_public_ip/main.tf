resource "azurerm_public_ip" "pip" {
    for_each = var.pip
  name                = each.value.pip_name  #"acceptanceTestPublicIp1"
  resource_group_name = each.value.resource_group_name   #azurerm_resource_group.example.name
  location            = each.value.location 
  allocation_method   = "Static"
}