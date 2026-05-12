resource "azurerm_storage_container" "blob-1" {
  depends_on            = [azurerm_storage_account.stg-1]
  name                  = "blobcontainer01"
  storage_account_id    = "/subscriptions/82d3dff2-2cf6-4e19-acac-54a089e83994/resourceGroups/rg-terraform-01/providers/Microsoft.Storage/storageAccounts/stgvaibaj1"
  container_access_type = "private"
}