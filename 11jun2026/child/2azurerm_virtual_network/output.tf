output "vnet_ids"{
    value = {
        for k, v in azurerm_virtual_network.vnetblock : k=> v.id
    }
}