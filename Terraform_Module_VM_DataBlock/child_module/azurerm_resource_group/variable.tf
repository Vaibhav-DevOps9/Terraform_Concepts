variable "rgs" {
    description = "Resource Group"
    type = map(object({
        rg_name = string
        location = string
    }))
  
}