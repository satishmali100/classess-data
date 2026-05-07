# resource "azurerm_resource_group" "block1" {
#   name     = "Himnashu"
#   location = "West Europe"
# }

# resource "azurerm_resource_group" "block1" {
#   name     = var.him
#   location = "West Europe"
# }


## LIST## name only

# resource "azurerm_resource_group" "block_liststring"  {
# for_each = toset (["rg-dev", "rg-test", "rg-prod"])
# name = each.value
# location = "West Europe"
# }


## LIST## name & resources 

# resource "azurerm_resource_group" "block_liststring"  {
# for_each = ("rg-123"="eastws")
# name = each.key
# location = each.value
# }




