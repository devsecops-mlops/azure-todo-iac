variable "appgws" {
  description = "Map of Application Gateways and their configuration"
  type = map(object({
    application_gateway_name = string
    rg_name                  = string
    location                 = string

    # Networking lookups
    vnet_name      = string
    subnet_name    = string
    public_ip_name = string

    sku = object({
      name     = string
      tier     = string
      capacity = number
    })

    gateway_ip_configuration = object({
      name = string
    })

    frontend_port = object({
      name = string
      port = number
    })

    frontend_ip_configuration = object({
      name = string
    })

    backend_address_pool = object({
      name = string
    })

    backend_http_settings = object({
      name                  = string
      cookie_based_affinity = string
      path                  = string
      port                  = number
      protocol              = string
      request_timeout       = number
    })

    http_listener = object({
      name                           = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      protocol                       = string
    })

    request_routing_rule = object({
      name                       = string
      priority                   = number
      rule_type                  = string
      http_listener_name         = string
      backend_address_pool_name  = string
      backend_http_settings_name = string
    })
  }))
}
