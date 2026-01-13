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
