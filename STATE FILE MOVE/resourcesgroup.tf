
resource "azurerm_resource_group" "satish-group" {
  name     = "test-satish1"
  location = "West Europe"
}

resource "azurerm_resource_group" "test-satish2" {
  name     = "test-satish2"
  location = "West Europe"
}