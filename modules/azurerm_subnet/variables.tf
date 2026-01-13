variable "subnets" {
  type = map(object({
    rg_name = string
    vnet_name = string
    subnet_name = string
    address_prefixes = list(string)

    default_outbound_access_enabled               = optional(bool)
    private_endpoint_network_policies             = optional(string)
    private_link_service_network_policies_enabled = optional(bool)
    sharing_scope                                 = optional(string)
    service_endpoints                             = optional(list(string))
    service_endpoint_policy_ids                   = optional(list(string))
  }))

}
