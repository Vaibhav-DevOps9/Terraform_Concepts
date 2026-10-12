variable "rgs" {
  description = "Resource Group created in Azure Landing Zone"
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = string
    #tags       = string
  }))

}