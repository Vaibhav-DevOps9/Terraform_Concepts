variable "pip" {
  description = "Public Ip's in the Azure Landing Zone"
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}