output "azurerm_subnet" {
value = {
    for k ,v in azurerm_subnet.svsblock : k=>{
        name =v.name
        resource_group_name = v.resource_group_name
        virtual_network_name = v.virtual_network_name
        address_prefixes = v.address_prefixes
    
    }

}
}