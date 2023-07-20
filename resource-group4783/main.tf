resource "azurerm_resource_group" "resource-group" {
  name     = var.rg-name
  location = var.location
  tags     = var.tags
}