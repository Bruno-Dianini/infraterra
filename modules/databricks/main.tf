resource "azurerm_databricks_workspace" "databricks" {
  name                          = var.databricks
  location                      = var.location
  resource_group_name           = var.rg-name
  sku                           = "standard"
  managed_resource_group_name   = var.databricks-manag
  public_network_access_enabled = true
}