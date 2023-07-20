terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateno1514783RG"
    storage_account_name = "tfstaten01514783sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}