resource "azurerm_user_assigned_identity" "ad" {
  name                = var.ad
  location            = var.location
  resource_group_name = var.rg-name
}

resource "azurerm_mssql_server" "sql" {
  name                          = var.sql
  resource_group_name           = var.rg-name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = "missadministrator"
  administrator_login_password  = "thisIsKat11"
  minimum_tls_version           = "1.2"
  public_network_access_enabled = false


  azuread_administrator {
    login_username = azurerm_user_assigned_identity.ad.name
    object_id      = var.ad_id
  }
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.ad.id]
  }

  primary_user_assigned_identity_id            = azurerm_user_assigned_identity.ad.id


}



resource "azurerm_mssql_database" "testdb" {
  name         = var.database
  server_id    = azurerm_mssql_server.sql.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "S0"
}