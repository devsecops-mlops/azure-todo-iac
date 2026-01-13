module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "networks" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_network"
  azure_virtual_networks = var.azure_virtual_networks

}

module "network_security_group" {
  depends_on = [ var.azure_virtual_networks ]
  source = "../../modules/azurem_nsg"
  nsgs = var.nsgs

}
