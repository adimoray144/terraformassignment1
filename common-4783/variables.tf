variable "rg-name" {}
variable "location" {}
variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
  default     = "stracn01514783"
}
variable "recovery_services_vault" {
  type = map(string)
  default = {
    vault_name = "myrecovery-vault"
    vault_sku  = "Standard"
  }
}

variable "tags" {
  type    = map(string)
}

variable "subnet_id" {}

