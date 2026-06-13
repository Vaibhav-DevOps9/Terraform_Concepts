variable "rg" {
  description = "Resource Group"
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}