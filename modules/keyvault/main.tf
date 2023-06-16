data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "key_vault" {
  name                          = var.key
  location                      = var.location
  resource_group_name           = var.rg-name
  sku_name                      = "standard"
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days    = 7
  purge_protection_enabled      = true
  public_network_access_enabled = false

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["Get", "List", "Create", "Delete", "Update", "Recover", "Purge", "GetRotationPolicy"]
  }

}

