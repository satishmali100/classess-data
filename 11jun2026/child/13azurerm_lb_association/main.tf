resource "azurerm_network_interface_backend_address_pool_association" "backend" {
  for_each = var.lb_association.backend_assoc

  network_interface_id    = var.lb_association.nic_ids[each.value.nic_key]
  ip_configuration_name   = each.value.ip_name
  backend_address_pool_id = var.lb_association.backend_pool_ids[each.value.backend_pool_key]
}

resource "azurerm_network_interface_nat_rule_association" "nat" {
  for_each = var.lb_association.nat_assoc

  network_interface_id  = var.lb_association.nic_ids[each.value.nic_key]
  ip_configuration_name = each.value.ip_name
  nat_rule_id           = var.lb_association.nat_rule_ids[each.value.nat_rule_key]
}