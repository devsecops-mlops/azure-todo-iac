module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_networks" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_virtual_network"
  azure_virtual_networks = var.azure_virtual_networks

}

module "network_security_group" {
  depends_on = [ var.azure_virtual_networks,module.subnets ]
  source = "../../modules/azurem_nsg"
  nsgs = var.nsgs

}

module "subnets" {
  depends_on = [ module.virtual_networks ]
  source = "../../modules/azurerm_subnet"
  subnets = var.subnets
}
