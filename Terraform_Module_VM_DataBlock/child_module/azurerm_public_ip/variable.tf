variable "pip" {
    description = "Public IP"
    type = map(object({
        pip_name = string
        rg_name = string
        location = string
    }))
  
}