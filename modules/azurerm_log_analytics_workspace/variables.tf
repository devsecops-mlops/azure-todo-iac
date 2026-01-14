variable "laws" {

  type = map(object({
    law_name          = string
    location          = string
    rg_name           = string
    sku               = string
    retention_in_days = number
  }))

}
