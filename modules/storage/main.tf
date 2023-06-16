resource "azurerm_storage_account" "kumulustorage" {
  name                = var.storage
  resource_group_name = var.rg-name

  location                      = var.location
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = false
  //opicional
  min_tls_version = "TLS1_2"

  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }

    hour_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }

    minute_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }

}