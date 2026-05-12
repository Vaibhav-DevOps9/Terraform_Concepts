# RG created for storage account, blob container and backend state storage
resource "azurerm_resource_group" "rg-1" {
  name     = var.rg_name
  location = "centralindia"
}

resource "azurerm_resource_group" "rg-2" {
  for_each = toset(var.rg_name2)
  name     = each.key # each.value can also be used
  location = "centralindia"
}
