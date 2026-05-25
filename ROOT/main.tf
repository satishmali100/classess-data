module  "resource_group" {

source = "./MODULE/Resource_group"
for_each = var.rgs

name = each.value.name
location = each.value.location

}
