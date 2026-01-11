variable "rgs" {
  description = "Map of resource groups with configuration details"
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)      # optional: allows omitting
    tags       = optional(map(string)) # optional: allows empty tags
  }))
}
