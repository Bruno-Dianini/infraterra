resource "azurerm_data_factory" "kumulusdataf" {
  name                   = var.datafactory
  location               = var.location
  resource_group_name    = var.rg-name
  public_network_enabled = false
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "kumuluslinked" {
  name              = var.datalinked
  data_factory_id   = azurerm_data_factory.kumulusdataf.id
  connection_string = var.storage_connection
}


resource "azurerm_data_factory_pipeline" "kumuluspipeline" {
  name            = var.datapipeline
  data_factory_id = azurerm_data_factory.kumulusdataf.id

}

resource "azurerm_data_factory_linked_service_key_vault" "factory_good" {
  name            = var.datakey
  data_factory_id = azurerm_data_factory.kumulusdataf.id
  key_vault_id    = var.key_id
}