resource "azurerm_logic_app_workflow" "logicapp" {
  name                = var.logicapp
  location            = var.location
  resource_group_name = var.rg-name
}
