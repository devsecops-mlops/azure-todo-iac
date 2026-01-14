resource "azurerm_linux_virtual_machine_scale_set" "linux_vmss" {
  for_each                        = var.linux_vmss_config
  name                            = each.value.vmss_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  sku                             = each.value.sku
  instances                       = each.value.instances
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication



  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }

  os_disk {
    storage_account_type = each.value.os_disk.storage_account_type
    caching              = each.value.os_disk.caching
  }

  network_interface {
    name    = each.value.network_interface.name
    primary = true

    ip_configuration {
      name      = each.value.network_interface.ip_configuration.name
      primary   = true
      subnet_id = data.azurerm_subnet.frontend_subnet[each.key].id
    }
  }
}



data "azurerm_subnet" "frontend_subnet" {
  for_each = var.linux_vmss_config
  name = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name = each.value.rg_name

}
