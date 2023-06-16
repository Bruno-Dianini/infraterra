resource "azurerm_purview_account" "purview" {
  name                = var.purview
  resource_group_name = var.rg-name
  location            = var.location

  identity {
    type = "SystemAssigned"
  }
}