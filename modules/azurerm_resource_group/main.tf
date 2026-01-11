resource "azurerm_resource_group" "resource_group" {

  for_each   = var.rgs
  name       = each.value.rg_name
  location   = each.value.location
  managed_by = each.value.managed_by
  tags       = each.value.tags

}
