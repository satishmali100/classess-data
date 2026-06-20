output "rg_ids" {
    value = {
        for k, v in azurerm_resource_group.rgblock : k=> v.id
    }
}