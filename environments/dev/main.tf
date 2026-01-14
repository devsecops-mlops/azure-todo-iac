module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_networks" {
  depends_on             = [module.resource_group]
  source                 = "../../modules/azurerm_virtual_network"
  azure_virtual_networks = var.azure_virtual_networks

}

module "network_security_group" {
  depends_on = [var.azure_virtual_networks, module.subnets]
  source     = "../../modules/azurem_nsg"
  nsgs       = var.nsgs

}

module "subnets" {
  depends_on = [module.virtual_networks]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}


module "subnet_to_nsg_association" {
  depends_on              = [module.network_security_group, module.subnets]
  source                  = "../../modules/azurerm_subnet_nsg_association"
  subnet_nsg_associations = var.subnet_nsg_associations

}


module "linux_vmss" {
  depends_on        = [module.subnets]
  source            = "../../modules/azurerm_vmss"
  linux_vmss_config = var.linux_vmss_config

}


module "law" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_log_analytics_workspace"
  laws = var.laws
}
