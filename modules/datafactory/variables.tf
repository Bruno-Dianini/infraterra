variable "rg-name" {
  type    = string
  default = "kumulus-test"
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "datafactory" {
  type    = string
  default = "kumulusdatafac"
}

variable "datalinked" {
  type    = string
  default = "kumuluslinked"
}
variable "datapipeline" {
  type    = string
  default = "datapipeline"
}
variable "datakey" {
  type    = string
  default = "datakumulustest"
}

variable "storage_connection" {}
variable "key_id" {}