resource "azurerm_storage_container" "blob1" {
    for_each = var.blob1
    name = each.vale.blob_name
    storage_account_id = ""
    container_access_type = "private"
}