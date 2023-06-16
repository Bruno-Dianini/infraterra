provider "azurerm" {
  features {

  }
}

module "locals" {
  source   = "./modules/locals"
  rg-name  = var.rg-name
  location = var.location
}

module "storage" {
  source             = "./modules/storage"
  rg-name            = var.rg-name
  location           = var.location
  storage            = var.storage
  storage_connection = module.storage.storage_connection


  depends_on = [module.locals]
}

module "logicapp" {
  source   = "./modules/logicapp"
  rg-name  = var.rg-name
  location = var.location
  logicapp = var.logicapp

  depends_on = [module.storage]
}

module "databricks" {
  source           = "./modules/databricks"
  rg-name          = var.rg-name
  location         = var.location
  databricks       = var.databricks
  databricks-manag = var.databricks-manag

  depends_on = [module.logicapp]
}

module "keyvault" {
  source   = "./modules/keyvault"
  rg-name  = var.rg-name
  location = var.location
  key      = var.key
  key_id   = module.keyvault.key_id

  depends_on = [module.databricks]

}

module "datafactory" {
  source             = "./modules/datafactory"
  rg-name            = var.rg-name
  location           = var.location
  datafactory        = var.datafactory
  datalinked         = var.datalinked
  datapipeline       = var.datapipeline
  datakey            = var.datakey
  storage_connection = module.storage.storage_connection
  key_id             = module.keyvault.key_id

  depends_on = [module.keyvault]
}

module "sql" {
  source   = "./modules/sqlserver"
  rg-name  = var.rg-name
  location = var.location
  sql = var.sql
  database = var.database
  ad = var.ad
  key_id   = module.keyvault.key_id
  ad_id    = module.sql.ad_id

  depends_on = [module.datafactory]
}

module "analysis" {
  source   = "./modules/analysis"
  rg-name  = var.rg-name
  location = var.location
  analysis = var.analysis

  depends_on = [module.sql]
}

module "purview" {
  source   = "./modules/purview"
  rg-name  = var.rg-name
  location = var.location
  purview = var.purview

  depends_on = [module.analysis]
}
