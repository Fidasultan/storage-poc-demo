resource "azurerm_resource_group" "rg" {
  name     = var.rg-name
  location = var.location
}



resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage-account-name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

# Create a container in the storage account
resource "azurerm_storage_container" "blob-container" {
  name                  = var.container-name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}