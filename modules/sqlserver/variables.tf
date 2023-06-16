variable "rg-name" {
  type    = string
  default = "kumulus-test"
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "sql" {
  type    = string
  default = "sqlkumulustet"
}

variable "database" {
  type    = string
  default = "sqlkumulusdb"
}
variable "ad" {
  type    = string
  default = "example-admin"
}

variable "ad_id" {}
variable "key_id" {}
