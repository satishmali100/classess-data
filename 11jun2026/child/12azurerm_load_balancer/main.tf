resource "azurerm_lb" "lb" {
  for_each = var.lb.lbs

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku

  frontend_ip_configuration {
    name                 = each.value.frontend_name
    public_ip_address_id = var.lb.pip_ids[each.value.public_ip_key]
  }
}

resource "azurerm_lb_backend_address_pool" "pool" {
  for_each = var.lb.backend_pools

  name            = each.value.name
  loadbalancer_id = azurerm_lb.lb[each.value.lb_key].id
}

resource "azurerm_lb_probe" "probe" {
  for_each = var.lb.probes

  name            = each.value.name
  loadbalancer_id = azurerm_lb.lb[each.value.lb_key].id
  protocol        = each.value.protocol
  port            = each.value.port
  request_path    = each.value.request_path
}

resource "azurerm_lb_rule" "rule" {
  for_each = var.lb.rules

  name                           = each.value.name
  loadbalancer_id                = azurerm_lb.lb[each.value.lb_key].id
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = var.lb.lbs[each.value.lb_key].frontend_name

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.pool[each.value.backend_pool_key].id
  ]

  probe_id = azurerm_lb_probe.probe[each.value.probe_key].id
}

resource "azurerm_lb_nat_rule" "nat" {
  for_each = var.lb.nat_rules

  name                           = each.value.name
  resource_group_name            = var.lb.lbs[each.value.lb_key].resource_group_name
  loadbalancer_id                = azurerm_lb.lb[each.value.lb_key].id
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = var.lb.lbs[each.value.lb_key].frontend_name
}
