resource "azurerm_virtual_network" "network" {
  for_each = var.azure_virtual_networks

  # Required
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  # Optional flat arguments
  address_space                  = each.value.address_space
  dns_servers                     = each.value.dns_servers
  bgp_community                   = each.value.bgp_community
  edge_zone                        = each.value.edge_zone
  flow_timeout_in_minutes          = each.value.flow_timeout_in_minutes
  private_endpoint_vnet_policies   = each.value.private_endpoint_vnet_policies
  tags                             = each.value.tags

  
}

