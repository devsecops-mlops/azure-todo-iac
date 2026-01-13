resource "azurerm_network_security_group" "todo_nsg" {
  for_each = var.nsgs

  # Required
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  # Optional dynamic security rules
  dynamic "security_rule" {
    for_each = each.value.security_rules

    content {
      name                               = security_rule.value.name
      description                        = security_rule.value.description
      protocol                            = security_rule.value.protocol
      source_port_range                   = security_rule.value.source_port_range
      source_port_ranges                  = security_rule.value.source_port_ranges
      destination_port_range              = security_rule.value.destination_port_range
      destination_port_ranges             = security_rule.value.destination_port_ranges
      source_address_prefix               = security_rule.value.source_address_prefix
      source_address_prefixes             = security_rule.value.source_address_prefixes
      source_application_security_group_ids = security_rule.value.source_application_security_group_ids
      destination_address_prefix          = security_rule.value.destination_address_prefix
      destination_address_prefixes        = security_rule.value.destination_address_prefixes
      destination_application_security_group_ids = security_rule.value.destination_application_security_group_ids
      access                              = security_rule.value.access
      priority                            = security_rule.value.priority
      direction                           = security_rule.value.direction
    }
  }

  # Optional tags
  tags = each.value.tags
}
