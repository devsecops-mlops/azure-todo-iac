variable "linux_vmss_config" {
  type = map(object({
    vmss_name                       = string
    rg_name                         = string
    location                        = string
    sku                             = string
    instances                       = number
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    subnet_name                     = string
    vnet_name                       = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    os_disk = object({
      storage_account_type = string
      caching              = string
    })
    network_interface = object({
      name = string
      ip_configuration = object({
        name = string
      })
    })
  }))
}
