resource "azurerm_resource_group" "state_rg" {
  name     = "terraform-mgmt-rg"
  location = "southindia"
}

resource "azurerm_storage_account" "state_sa" {
  name                     = "productionstorage2026" # Must be unique
  resource_group_name      = azurerm_resource_group.state_rg.name
  location                 = azurerm_resource_group.state_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "state_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.state_sa.name
}
