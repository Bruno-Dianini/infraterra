resource "azurerm_analysis_services_server" "analysistest" {
  name                    = var.analysis
  resource_group_name     = var.rg-name
  location                = var.location
  sku                     = "S0"
  enable_power_bi_service = true

  ipv4_firewall_rule {
    name        = "myRule1"
    range_start = "210.117.252.0"
    range_end   = "210.117.252.255"
  }
}