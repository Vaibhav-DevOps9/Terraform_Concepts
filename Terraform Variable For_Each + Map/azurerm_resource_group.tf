resource "azurerm_resource_group" "rg1" {
  name     = "rg15may"
  location = "eastus"
}

resource "azurerm_resource_group" "abc" {
  for_each = var.rg
  name     = each.key
  location = each.value
}