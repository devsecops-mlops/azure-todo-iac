variable "rgs" {
  description = "Map of resource groups with configuration details"
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)      # optional: allows omitting
    tags       = optional(map(string)) # optional: allows empty tags
  }))
}


variable "azure_virtual_networks" {
  description = "Map of Azure virtual networks"
  type = map(object({
    vnet_name = string
    location  = string
    rg_name   = string

    # Optional flat arguments
    address_space                  = optional(list(string))
    dns_servers                    = optional(list(string))
    bgp_community                  = optional(string)
    edge_zone                      = optional(string)
    flow_timeout_in_minutes        = optional(number)
    private_endpoint_vnet_policies = optional(string)
    tags                           = optional(map(string))

  }))
}


variable "nsgs" {
  description = "Map of Network Security Groups with rules"
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
    tags     = optional(map(string)) # optional tags
    security_rules = map(object({
      # Required fields
      name      = string
      protocol  = string
      access    = string
      priority  = number
      direction = string

      # Optional fields
      description                                = optional(string)
      source_port_range                          = optional(string)
      source_port_ranges                         = optional(list(string))
      destination_port_range                     = optional(string)
      destination_port_ranges                    = optional(list(string))
      source_address_prefix                      = optional(string)
      source_address_prefixes                    = optional(list(string))
      source_application_security_group_ids      = optional(list(string))
      destination_address_prefix                 = optional(string)
      destination_address_prefixes               = optional(list(string))
      destination_application_security_group_ids = optional(list(string))
    }))
  }))
}



variable "subnets" {
  type = map(object({
    rg_name          = string
    vnet_name        = string
    subnet_name      = string
    address_prefixes = list(string)

    default_outbound_access_enabled               = optional(bool)
    private_endpoint_network_policies             = optional(string)
    private_link_service_network_policies_enabled = optional(bool)
    sharing_scope                                 = optional(string)
    service_endpoints                             = optional(list(string))
    service_endpoint_policy_ids                   = optional(list(string))
  }))

}


variable "subnet_nsg_associations" {
  type = map(object({
    subnet_name = string
    vnet_name   = string
    rg_name     = string
    nsg_name    = string

  }))

}



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
variable "laws" {

  type = map(object({
    law_name          = string
    location          = string
    rg_name           = string
    sku               = string
    retention_in_days = number
  }))

}
variable "pips" {
  type = map(object({
    public_ip_name    = string
    rg_name           = string
    location          = string
    allocation_method = string
    tags              = map(string)
  }))
}
