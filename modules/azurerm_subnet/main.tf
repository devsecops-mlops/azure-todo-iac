resource "azurerm_subnet" "todo_subnets" {
  for_each = var.subnets

  # =========================
  # REQUIRED
  # =========================
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name

  # Exactly ONE of these must be set
  address_prefixes = each.value.address_prefixes
  # ip_address_pool  = each.value.ip_address_pool   # use only if not using address_prefixes

  # =========================
  # OPTIONAL (EXPLICIT)
  # =========================
  default_outbound_access_enabled              = each.value.default_outbound_access_enabled
  private_endpoint_network_policies            = each.value.private_endpoint_network_policies
  private_link_service_network_policies_enabled = each.value.private_link_service_network_policies_enabled
  sharing_scope                                = each.value.sharing_scope
  service_endpoints                            = each.value.service_endpoints
  service_endpoint_policy_ids                  = each.value.service_endpoint_policy_ids
}
