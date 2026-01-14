variable "pips" {
  type = map(object({
    public_ip_name    = string
    rg_name           = string
    location          = string
    allocation_method = string
    tags              = map(string)
  }))
}
