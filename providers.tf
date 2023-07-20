terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.65.0"
    }
  }
}
# configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
