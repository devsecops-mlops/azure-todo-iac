variable "azure_virtual_networks" {
  description = "Map of Azure virtual networks"
  type = map(object({
    vnet_name                       = string
    location                        = string
    rg_name                          = string

    # Optional flat arguments
    address_space                    = optional(list(string))
    dns_servers                      = optional(list(string))
    bgp_community                    = optional(string)
    edge_zone                        = optional(string)
    flow_timeout_in_minutes          = optional(number)
    private_endpoint_vnet_policies   = optional(string)
    tags                             = optional(map(string))

    # Subnets
    subnets = map(object({
      subnet_name      = string
      address_prefixes = list(string)
    }))
  }))
}

