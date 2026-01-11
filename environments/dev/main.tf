module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "networks" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_network"
  azure_virtual_networks = var.azure_virtual_networks

}
